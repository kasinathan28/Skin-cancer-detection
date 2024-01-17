import 'package:flutter/material.dart';
import 'package:my_app/screens/PreviosData/component/appBar.dart';
import 'package:my_app/screens/PreviosData/component/imagelistview.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: ImageListView(),
    );
  }
} 
