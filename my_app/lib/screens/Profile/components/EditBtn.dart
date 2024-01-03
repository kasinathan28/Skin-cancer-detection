import "package:flutter/material.dart";
import "package:my_app/components/rounded_button.dart";
import "package:my_app/screens/EditScreen/EditScreen.dart";

class EdiBtn extends StatelessWidget {
  const EdiBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: RoundedButton(
        text: "Edit",
        press: () {
          Navigator.push(context,MaterialPageRoute(builder: 
          (context){
            return EditScreen();
          }
          ));
          print("edit button pressed");
        },
      ),
    );
  }
}
