import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    double paddingValue = screenSize.width * 0.03;

    return Positioned(
      bottom: screenSize.height * 0.15,
      child: Card(
        elevation: 3,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.all(paddingValue),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.upload),
                SizedBox(width: 8),
                Text("Upload Image"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
