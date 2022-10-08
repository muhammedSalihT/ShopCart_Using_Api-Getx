import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    Key? key,
    this.width,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.icon,
    this.hideText = false,
    required this.hintText,
    this.controller,
  }) : super(key: key);

  final double? width;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validator;
  final IconData? icon;
  final bool hideText;
  final String hintText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: TextFormField(
        textInputAction: TextInputAction.next,
        controller: controller,
        obscureText: hideText,
        validator: validator,
        keyboardType: keyboardType,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              borderSide: BorderSide(color: Colors.red),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              borderSide: BorderSide(),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              borderSide: BorderSide(color: Colors.green, width: 2),
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            hintText: hintText,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            filled: true,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            fillColor: const Color(0x77ffffff)),
      ),
    );
  }
}
