import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/components/RoundLogoutButton.dart';
import 'package:my_app/screens/Login/login_screen.dart';

class LogOutBtn extends StatelessWidget {
  const LogOutBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: RoundLogoutButton(
        text: "Logout",
        press: () async {
          try {
            await FirebaseAuth.instance.signOut();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) {
              return LoginScreen();
            }));
          } catch (e) {
            print('Error signing out: $e');
          }
        },
      ),
    );
  }
}