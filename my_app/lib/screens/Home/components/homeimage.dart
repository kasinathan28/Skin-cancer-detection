import "package:flutter/material.dart";

class HomeImage extends StatelessWidget {
  final image;
  const HomeImage({
    Key? key, 
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top:180,
      child: Image.asset(
        "$image",
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.9,
      ),
    );
  }
}
