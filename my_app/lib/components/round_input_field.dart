// round_input_field.dart

import 'package:flutter/material.dart';
import 'package:my_app/components/text_field_conatiner.dart';
import 'package:my_app/constant.dart';

class RoundInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  const RoundInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
    required this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
        validator: validator,
      ),
    );
  }
}
