import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_shopcart/authentication_page/controllers/loginview_controller.dart';
import 'package:project_shopcart/constends/box.dart';
import 'package:project_shopcart/constends/colors.dart';
import 'package:project_shopcart/widgets/custom_textformcard.dart';
import 'package:project_shopcart/widgets/custom_textform.dart';

class LoginView extends StatelessWidget {
  LoginView({
    Key? key,
  }) : super(key: key);

  final loginController = Get.put(LoginViewController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Box().sizedBox1,
        Form(
          key: loginController.formKey,
          child: CoustemTextFormCard(
            height: 0,
            childrens: [
              const SizedBox(
                height: 20,
              ),
              CustomTextForm(
                  validator: (value) =>
                      value != null && GetUtils.isEmail(value.trim())
                          ? null
                          : "Check Your Email",
                  hintText: "Email"),
              Box().sizedBox1,
              CustomTextForm(
                  validator: (value) =>
                      value != null && GetUtils.isLengthBetween(value, 3, 10)
                          ? null
                          : "Check Your Password",
                  hintText: "password"),
              Box().sizedBox2,
              Container(
                width: 250,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(shape: const StadiumBorder()),
                    onPressed: () {
                      // Get.to(HomeScreen());
                      loginController.validated();
                    },
                    child: const Text("LogIn")),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Forgot password?",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 16.0,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Box().sizedBox1,
                    dividerLine(),
                    Text(
                      'or',
                      style: TextStyle(color: ConstColor().whiteColor),
                    ),
                    dividerLine(),
                    Box().sizedBox1,
                  ],
                ),
              ),
              Box().sizedBox1,
              Text(
                'Login With',
                style: TextStyle(color: ConstColor().brightWhite),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Container(
                  height: 50,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Image.asset(
                        "assets/google_logo.png",
                        height: 40,
                      ),
                      const Icon(
                        Icons.facebook,
                        size: 50,
                      ),
                      const Icon(
                        Icons.phone_android,
                        size: 50,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: MediaQuery.of(context).viewInsets.bottom != 0,
          child: const SizedBox(
            height: 250,
          ),
        )
      ],
    );
  }

  Expanded dividerLine() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Divider(
          color: ConstColor().whiteColor,
          thickness: 1,
        ),
      ),
    );
  }
}
