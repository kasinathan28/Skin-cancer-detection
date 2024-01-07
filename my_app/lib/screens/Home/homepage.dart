import 'package:flutter/material.dart';
import 'package:my_app/screens/Home/components/mainpage.dart';
// import 'package:my_app/components/BottomNavigationBar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainPage(),
      // bottomNavigationBar: BottomNavigationBar1(),
    );
  }
}
