import 'package:flutter/material.dart';
import 'package:my_app/constant.dart';
import 'package:my_app/screens/Home/components/home_text.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 520,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "We care for you",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: kPrimaryColor,
            ),
          ),
          SizedBox(height: 16),
          home_text(
            text: "Your skin's health is our priority",
          ),
          home_text(text: "Our app uses advanced technology"),
          home_text(text: "to help you detect skin cancer early"),
          home_text(text: " ensuring a healthier future for you."),
        ],
      ),
    );
  }
}
