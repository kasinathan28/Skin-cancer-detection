import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_app/components/already_have_an_account.dart';
import 'package:my_app/components/round_input_field.dart';
import 'package:my_app/components/round_password_field.dart';
import 'package:my_app/components/rounded_button.dart';
import 'package:my_app/constant.dart';
import 'package:my_app/screens/Home/homepage.dart';
import 'package:my_app/screens/Login/components/background.dart';
import 'package:my_app/screens/SignUp/signup_screen.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isloading = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _emailError = '';
  String _passwordError = '';

   signInWithEmailAndPassword() async {
    try {
      setState(() {
        isloading = true;
      });

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Login Success',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: kPrimaryColor,
          duration: Duration(seconds: 2),
        ),
      );
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return HomePage();
      }));
    } on FirebaseAuthException catch (e) {
      setState(() {
        isloading = false;
      });

      if (e.code == 'user-not-found') {
        setState(() {
          _emailError = 'No user found for that email.';
        });
        
      } else if (e.code == 'wrong-password') {
        setState(() {
          _passwordError = 'Wrong password provided for that user.';
        });
      }
    } finally {
      setState(() {
        isloading = false;
      });
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
              "LOGIN",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.3,
            ),
            SizedBox(
              height: size.height * 0.03,
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
                        _emailError = '';
                      });
                    },
                    icon: Icons.person,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "Email is required";
                      } else if (!RegExp(
                              r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                          .hasMatch(text)) {
                        return 'Invalid email format';
                      }
                      return null;
                    },
                  ),
                  Text(
                    _emailError,
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                  RoundPasswordField(
                    controller: _passwordController,
                    onChanged: (value) {
                      setState(() {
                        _passwordError = '';
                      });
                    },
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "Password is required";
                      }
                      return null;
                    },
                    hintText: 'Your Password',
                  ),
                  Text(
                    _passwordError,
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                  isloading
                      ? CircularProgressIndicator()
                      : RoundedButton(
                          text: "LOGIN",
                          press: () {
                            if (_formKey.currentState!.validate()) {
                              signInWithEmailAndPassword();
                            }
                          },
                        ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            AlreadyHaveAnAccount(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignupScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
