import 'package:flutter/material.dart';
import 'package:my_app/components/BottomNavogationBar.dart';
import 'package:my_app/screens/Home/components/body.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Body(),
      bottomNavigationBar: BottomNavigatinBar(),
    );
}
}