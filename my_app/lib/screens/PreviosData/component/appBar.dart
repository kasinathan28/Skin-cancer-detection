import 'package:flutter/material.dart';
import 'package:my_app/constant.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(100.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.only(top: 42,left: 25),
          child: Text(
            "Previous Data",
            style: TextStyle(
              fontSize: 24.0,
            ),
          ),
        ),
      ),
      backgroundColor: kPrimaryLightColor,
      centerTitle: false,
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
      ],
    );
  }
}
