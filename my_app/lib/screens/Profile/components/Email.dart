import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

class Email extends StatelessWidget {
  Email({
    super.key,
  });

  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Text(
        user!.email.toString(),
        style: TextStyle(
          fontSize: 18,
          color: Colors.grey,
        ),
      ),
    );
  }
}
