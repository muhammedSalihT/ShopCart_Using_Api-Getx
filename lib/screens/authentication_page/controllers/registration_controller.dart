import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:project_shopcart/screens/authentication_page/api/registration_api.dart';
import 'package:project_shopcart/screens/authentication_page/models/registration_model.dart';
import 'package:project_shopcart/screens/global_screen/views/global_screen.dart';

class RegistrationController extends GetxController {
  final formKey = GlobalKey<FormState>();

  TextEditingController reigsterEmailControll = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController numberControlletr = TextEditingController();

  validated() {
    if (formKey.currentState!.validate()) {}
  }

  ResUser? user;
  ResUser? currUser;
  final storage = const FlutterSecureStorage();
  final String USER_ID = 'user.id';

  saveUser(ResUser user) {
    storage.write(key: USER_ID, value: user.id);
    update();
  }

  Future<String?> loadUser() async {
    String value = await storage.read(key: "user.id") ?? "";
    return value;
  }

  checkRegister() async {
    validated();
    final userModel = ResUser(
      id: '',
      name: nameController.text,
      password: passwordController.text.trim(),
      email: reigsterEmailControll.text.trim(),
      type: '',
    );
    final SignUpResponseModel responce =
        await RegistrationApi().signupUser(userModel);
    if (responce.status != null) {
      if (responce.status == true) {
        Get.showSnackbar(GetSnackBar(
          message: responce.msg,
          duration: const Duration(seconds: 2),
        ));
         saveUser(responce.resUser!);
        Get.off(() =>GlobalScrren());
      } else {
        Get.showSnackbar(GetSnackBar(
          message: responce.msg.toString(),
          duration: const Duration(seconds: 2),
        ));
      }
    } else {
      Get.showSnackbar(GetSnackBar(
        message: responce.msg.toString(),
        duration: const Duration(seconds: 2),
      ));
    }
  }

  deleteUser() async {
    user = null;
    await storage.deleteAll();
  }

  @override
  void onClose() {
    RegistrationController().dispose();
    deleteUser();
    super.onClose();
  }
}
