import 'package:flutter/material.dart';
import 'package:my_app/components/rounded_button.dart';
import 'package:my_app/constant.dart';
import 'package:my_app/screens/Login/login_screen.dart';
import 'package:my_app/screens/SignUp/signup_screen.dart';
// import 'package:my_app/constant.dart';
import 'package:my_app/screens/welcome/components/background.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SKIN CANCER DETECTOR",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.08,
            ),
            SvgPicture.asset(
              "assets/icons/chat.svg",
              height: size.height * 0.45,
            ),
            SizedBox(
              height: size.height * 0.08,
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
              // size: size, 
            ),
            RoundedButton(
              text: "Signup",
              textColor: Colors.black,
              color: kPrimaryLightColor,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignupScreen();
                    },
                  ),
                );
              },
              // size: size, 
            ),
          ],
        ),
      ),
    );
  }
}
