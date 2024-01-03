import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_app/components/already_have_an_account.dart';
import 'package:my_app/components/round_input_field.dart';
import 'package:my_app/components/round_password_field.dart';
import 'package:my_app/components/rounded_button.dart';
import 'package:my_app/constant.dart';
import 'package:my_app/screens/Login/login_screen.dart';
import 'package:my_app/screens/SignUp/components/background.dart';
import 'package:my_app/screens/SignUp/components/or_divider.dart';
import 'package:my_app/screens/SignUp/components/social_icons.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isloading = false;
  String email = "";
  String password = "";
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

 createUserWithEmailAndPassword() async {
    try {
      setState(() {
        isloading = true;
      });

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
        
    } on FirebaseAuthException catch (e) {
      setState(() {
        isloading = true;
      });

      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }finally{
      
      setState(() {
        isloading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'SignUp Success',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: kPrimaryColor,
          duration: Duration(seconds: 2),
        ),
      );
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return LoginScreen();
      }));
    }
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SignUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  RoundInputField(
                    controller: _emailController,
                    hintText: "Your Email",
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Email is required';
                      } else if (!RegExp(
                              r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                          .hasMatch(text)) {
                        return 'Invalid email format';
                      }
                      return null;
                    },
                  ),
                  RoundPasswordField(
                    controller: _passwordController,
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Password is required';
                      } else if (text.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                    hintText: "Your Password",
                  ),
                ],
              ),
            ),
            isloading
                ? CircularProgressIndicator() // Show loading indicator
                : RoundedButton(
                    text: "SIGNUP",
                    press: () {
                      if (_formKey.currentState!.validate()) {
                        createUserWithEmailAndPassword();
                        print('Email: $email');
                        print('Password: $password');
                      }
                    },
                  ),
            SizedBox(
              height: size.height * 0.03,
            ),
            AlreadyHaveAnAccount(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return LoginScreen();
                  }),
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Socialicon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                Socialicon(
                  iconSrc: "assets/icons/google.svg",
                  press: () {},
                ),
                Socialicon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
