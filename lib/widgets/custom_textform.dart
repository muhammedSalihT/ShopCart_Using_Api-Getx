import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    Key? key,
    this.width,
    this.validator,
    this.keybordType = TextInputType.text,
    this.icon,
    this.hintText,
  }) : super(key: key);

  final double? width;
  final FormFieldValidator<String>? validator;
  final TextInputType keybordType;
  final IconData? icon;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextFormField(
        validator: validator,
        keyboardType: keybordType,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
                color: Colors.orangeAccent.withOpacity(0.5), width: 2),
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}
