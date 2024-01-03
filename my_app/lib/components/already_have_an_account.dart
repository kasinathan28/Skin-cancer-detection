import 'package:flutter/material.dart';
import 'package:my_app/constant.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  final bool login;
  final VoidCallback press; // Change the parameter type to VoidCallback
  const AlreadyHaveAnAccount({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don't have an account?" : "Already have an account?",
          style: TextStyle(color: kPrimaryColor),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? " Sign Up" : "Login",
            style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
