import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginViewController extends GetxController {
  final formKey = GlobalKey<FormState>();
  validated() async {
    if (formKey.currentState!.validate()) {}
  }
}
