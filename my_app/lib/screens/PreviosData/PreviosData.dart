import 'package:flutter/material.dart';

class PreviousData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text("Previous Data"),
        automaticallyImplyLeading: false, 
      ),
      body: Center(
        child: Text(
          "Previous Data Content Goes Here",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
