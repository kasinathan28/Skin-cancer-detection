// round_password_field.dart

import 'package:flutter/material.dart';
import 'package:my_app/components/text_field_conatiner.dart';
import 'package:my_app/constant.dart';

class RoundPasswordField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String>? validator;

  const RoundPasswordField({
    Key? key,
    required this.controller,
    required this.onChanged,
    this.validator, required String hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        obscureText: true,
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
        validator: validator,
      ),
    );
  }
}
