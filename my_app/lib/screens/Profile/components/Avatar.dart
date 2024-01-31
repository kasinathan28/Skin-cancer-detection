import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        setState(() {
          photoUrl = user.photoURL;
        });
      }
    } catch (e, stackTrace) {
      print("Error loading user profile: $e");
      print("StackTrace: $stackTrace");
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
                backgroundImage: photoUrl != null
                    ? NetworkImage(photoUrl!) as ImageProvider<Object>?
                    : AssetImage("assets/images/avatar.png"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
