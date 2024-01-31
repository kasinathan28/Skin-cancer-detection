import 'package:flutter/material.dart';
import 'package:my_app/screens/Home/homepage.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateHome(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text('Splash Screen', style: TextStyle(fontSize: 24)),
        ),
      ),
    );
  }

  void _navigateHome() async {
    await Future.delayed(Duration(milliseconds: 2000), () {});

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
  }
}
