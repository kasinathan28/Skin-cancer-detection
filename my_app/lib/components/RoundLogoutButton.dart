import 'package:flutter/material.dart';

class RoundLogoutButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;

  const RoundLogoutButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = Colors.red,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: ElevatedButton(
          onPressed: () => press(),
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
          style: ElevatedButton.styleFrom(
            primary: color,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          ),
        ),
      ),
    );
  }
}
