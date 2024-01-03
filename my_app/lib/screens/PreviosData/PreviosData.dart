import 'package:flutter/material.dart';
import 'package:my_app/components/BottomNavogationBar.dart';

class PreviousData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Previous Data"),
        automaticallyImplyLeading: false, 
      ),
      body: Center(
        child: Text(
          "Previous Data Content Goes Here",
          style: TextStyle(fontSize: 20),
        ),
      ),
      bottomNavigationBar: BottomNavigatinBar(),
    );
  }
}
