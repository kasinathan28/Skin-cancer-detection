import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    Size screenSize = MediaQuery.of(context).size;

    // Calculate responsive padding based on the screen width
    double paddingValue = screenSize.width * 0.05;

    return Positioned(
      bottom: screenSize.height * 0.15,
      child: Card(
        elevation: 5,
        child: InkWell(
          onTap: () {
            // Add your onTap logic here
          },
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
