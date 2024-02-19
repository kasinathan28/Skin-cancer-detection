import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Avatar extends StatefulWidget {
  const Avatar({Key? key}) : super(key: key);

  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  String? photoUrl;

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final userData = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();
        setState(() {
          photoUrl = userData.get('photoUrl');
          print('Photo URL: $photoUrl');
        });
      }
    } catch (e) {
      print("Error loading user profile: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 100,
                // Use photoUrl directly if not null, otherwise use a placeholder image
                backgroundImage: photoUrl != null
                    ? NetworkImage(photoUrl!) as ImageProvider<Object>?
                    : AssetImage("assets/images/avatar_placeholder.png") as ImageProvider<Object>?,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
