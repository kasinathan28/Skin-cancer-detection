import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:my_app/constant.dart';
import 'package:my_app/screens/Home/components/body.dart';
import 'package:my_app/screens/PreviosData/PreviosData.dart';
import 'package:my_app/screens/Profile/Profile.dart';

class BottomNavigationBar1 extends StatefulWidget {
  const BottomNavigationBar1({Key? key}) : super(key: key);

  @override
  _BottomNavigationBar1State createState() => _BottomNavigationBar1State();
}

class _BottomNavigationBar1State extends State<BottomNavigationBar1> {
  int _currentIndex = 1; // Set initial index to 1 (Home)
  final PageController _pageController = PageController(initialPage: 1); // Set initial page to 1 (Home)

  final List<IconData> _icons = [
    Icons.history,
    Icons.home,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          PreviousData(),
          Body(),
          Profile(),
        ],
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: _icons,
        activeIndex: _currentIndex,
        gapLocation: GapLocation.none,
        notchSmoothness: NotchSmoothness.softEdge,
        height: 82,
        leftCornerRadius: 40,
        rightCornerRadius: 40,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.jumpToPage(index);
          });
        },
        backgroundColor: kPrimaryColor,
        activeColor: kPrimaryLightColor,
        splashColor: Color.fromARGB(0, 144, 239, 86),
        splashRadius: 40,
      ),
    );
  }
}
