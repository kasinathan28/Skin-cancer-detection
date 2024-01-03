import "package:flutter/material.dart";

class home_text extends StatelessWidget {
  final String text;
  const home_text({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",
      style: TextStyle(
        fontSize: 16,
        color: Colors.black,
      ),
      textAlign: TextAlign.center,
    );
  }
}

