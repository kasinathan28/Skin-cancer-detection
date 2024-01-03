import "package:flutter/material.dart";



class Hi extends StatelessWidget {
  const Hi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Text(
        "Welcome back..",
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}