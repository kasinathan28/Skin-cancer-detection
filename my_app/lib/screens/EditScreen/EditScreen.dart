import 'package:flutter/material.dart';
import 'package:my_app/components/round_input_field.dart';
import 'package:my_app/components/rounded_button.dart';
import 'package:my_app/constant.dart';

class EditScreen extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  void onChanged(String value) {
    print("Input changed: $value");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        backgroundColor: kPrimaryLightColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage("assets/images/avatar.png"),
                ),
                Positioned(
                  bottom: 1,
                  left: 140,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add_a_photo),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundInputField(
                  hintText: "Email",
                  onChanged: onChanged,
                  controller: email,
                ),
                SizedBox(height: 16),
                RoundInputField(
                  hintText: "Password",
                  onChanged: onChanged,
                  controller: password,
                ),
                SizedBox(height: 16),
                RoundedButton(text: "Submit", press:(){
                }),
                                SizedBox(height: 86),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
