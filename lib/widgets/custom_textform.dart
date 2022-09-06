import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    Key? key,
    this.width,
  }) : super(key: key);
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: SizedBox(
        width: (width == null) ? 300 : width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.message,
                    color: Colors.black,
                  ),
                  hintText: "Email Address",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
