import 'package:flutter/material.dart';
import 'package:my_app/screens/Profile/components/ProfileData.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            ProfileData(),
          ],
        ),
      ),
    );
  }
}

