import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:my_app/constant.dart';

class ImageCard extends StatefulWidget {
  const ImageCard({
    Key? key,
  }) : super(key: key);

  @override
  _ImageCardState createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  final ImagePicker _imagePicker = ImagePicker();
  late FirebaseStorage _firebaseStorage;
  bool _uploading = false; 

  @override
  void initState() {
    super.initState();
    _firebaseStorage = FirebaseStorage.instance;
  }

  Future<void> _uploadImage(File imageFile) async {
    setState(() {
      _uploading = true;
    });

    Reference storageReference = _firebaseStorage.ref().child('images/${DateTime.now().toString()}');

    // Specify content type based on file extension or provide a default type
    String contentType = 'image/jpeg'; // Default content type

    if (imageFile.path.toLowerCase().endsWith('.png')) {
      contentType = 'image/png';
    } else if (imageFile.path.toLowerCase().endsWith('.gif')) {
      contentType = 'image/gif';
    }

    UploadTask uploadTask = storageReference.putFile(
      imageFile,
      SettableMetadata(contentType: contentType),
    );

    await uploadTask.whenComplete(() {
      setState(() {
        _uploading = false;
      });

      // Show a SnackBar with a success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Image uploaded successfully!', style: TextStyle(color: kPrimaryLightColor),),
          duration: Duration(seconds: 2),
          backgroundColor: kPrimaryColor,
          
        ),
      );
      print('Image uploaded');
    });
  }

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _uploadImage(File(pickedFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Positioned(
      bottom: screenSize.height * 0.05,
      child: _uploading
          ? CircularProgressIndicator()
          : FloatingActionButton.extended(
              onPressed: _pickImage,
              label: Text('Take a test'),
              icon: Icon(Icons.upload),
            ),
    );
  }
}
