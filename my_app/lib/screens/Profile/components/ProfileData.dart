import 'package:flutter/material.dart';
import 'package:my_app/screens/Profile/components/Avatar.dart';
import 'package:my_app/screens/Profile/components/EditBtn.dart';
import 'package:my_app/screens/Profile/components/Email.dart';
import 'package:my_app/screens/Profile/components/LogOutBtn.dart';
import 'package:my_app/screens/Profile/components/Hi.dart';

class ProfileData extends StatelessWidget {
  const ProfileData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Avatar(),
            SizedBox(height: 16),
            Hi(),
            SizedBox(height: 8),
            Email(),
            SizedBox(height: 22),
            EdiBtn(),
            SizedBox(height: 22),
            LogOutBtn(),
          ],
        ),
      ),
    );
  }
}




