import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_app/components/round_password_field.dart';
import 'package:my_app/components/rounded_button.dart';
import 'package:my_app/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Add this import statement


class EditScreen extends StatefulWidget {
  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();

  String? currentEmail;
  bool isLoading = false;
  File? _image;

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        setState(() {
          currentEmail = user.email;
        });
      }
    } catch (e, stackTrace) {
      print("Error updating user profile: $e");
      print("StackTrace: $stackTrace");
    }
  }

  void onChanged(String value) {
    print("Input changed: $value");
  }

  Future<void> _resetPassword() async {
    try {
      setState(() {
        isLoading = true;
      });

      User? user = _auth.currentUser;

      if (user != null) {
        // Reauthenticate with the user's current password
        AuthCredential credential = EmailAuthProvider.credential(
          email: user.email!,
          password: oldPasswordController.text,
        );

        await user.reauthenticateWithCredential(credential);

        // Change the password to the new password
        await user.updatePassword(newPasswordController.text);

        print("Password reset successful.");

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Password reset successful."),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        print("User is not logged in.");
      }
    } catch (e) {
      print("Error resetting password: $e");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text("Password reset failed. Please check your old password."),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _pickAndUploadImage() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });

      try {
        User? user = _auth.currentUser;

        if (user != null && _image != null) {
          String userId = user.uid;
          Reference ref = FirebaseStorage.instance
              .ref()
              .child("profile_pictures")
              .child("$userId.jpg");

          await ref.putFile(_image!);
          String imageUrl = await ref.getDownloadURL();

          // Save the image URL to Firestore
          FirebaseFirestore.instance.collection('users').doc(user.uid).set({
            'email': user.email,
            'profile_picture': imageUrl,
          });

          // Now imageUrl contains the URL of the uploaded image
          print("Image URL: $imageUrl");
        }
      } catch (e) {
        print("Error uploading image: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        backgroundColor: kPrimaryLightColor,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: _image != null
                        ? Image.file(_image!)
                            .image // Use Image.file and cast to ImageProvider
                        : AssetImage("assets/images/avatar.png"),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 140,
                    child: IconButton(
                      onPressed: _pickAndUploadImage,
                      icon: Icon(Icons.add_a_photo),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 16),
                  RoundPasswordField(
                    hintText: "Old Password",
                    onChanged: onChanged,
                    controller: oldPasswordController,
                  ),
                  SizedBox(height: 16),
                  RoundPasswordField(
                    hintText: "New Password",
                    onChanged: onChanged,
                    controller: newPasswordController,
                  ),
                  SizedBox(height: 16),
                  RoundedButton(text: "Update Profile", press: _resetPassword),
                  SizedBox(height: 16),
                  if (isLoading) CircularProgressIndicator(),
                  SizedBox(height: 70),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

