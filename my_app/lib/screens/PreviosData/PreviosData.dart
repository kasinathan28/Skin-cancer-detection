import 'package:flutter/material.dart';

class PreviousData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Previous Data"),
      ),
      body: Center(
        child: CardItem(),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9, // 90% of screen width
        height: 100,
        padding: EdgeInsets.all(16),
        child: Center(
          child: Text(
            "Card Demo",
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PreviousData(),
  ));
}
