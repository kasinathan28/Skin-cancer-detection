import "package:flutter/material.dart";
import 'package:my_app/components/BottomNavogationBar.dart';
import 'package:my_app/screens/Profile/components/body.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: BottomNavigatinBar(),
    );
  }
}
