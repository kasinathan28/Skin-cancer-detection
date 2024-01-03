import 'package:flutter/material.dart';
import 'package:my_app/screens/Home/homepage.dart';
import 'package:my_app/screens/PreviosData/PreviosData.dart';
import 'package:my_app/screens/Profile/profile.dart';

class BottomNavigatinBar extends StatelessWidget {
  const BottomNavigatinBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return PreviousData();
              }));
            },
          ),
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return HomePage();
              }));
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return Profile();
              }));
            },
          ),
        ],
      ),
    );
  }
}
