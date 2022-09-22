import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    Key? key,
    this.width,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.icon,
    this.hideText = false,
    required this.hintText, this.controller,
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
    return Card(
      elevation: 4.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: SizedBox(
        width: (width == null) ? 300 : width,
        child: Column(
          children: [
            TextFormField(
              controller: controller,
              obscureText: hideText,
              validator: validator,
              keyboardType: keyboardType,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: const BorderSide(color: Colors.orange)),
                border: InputBorder.none,
                prefixIcon: Icon(
                  icon,
                  color: Colors.black,
                ),
                hintText: hintText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
