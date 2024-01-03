import 'package:flutter/material.dart';
import 'package:my_app/components/CustomAppBar.dart';
import 'package:my_app/components/image_card.dart';
import 'package:my_app/screens/Home/components/home_content.dart';
import 'package:my_app/screens/Home/components/homeimage.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            alignment: Alignment.center,
            children: <Widget>[
              CustomAppBar(),
              HomeContent(),
              HomeImage(image: "assets/images/home.png"),
              ImageCard(),
            ],
          );
        },
      ),
    );
  }
}
