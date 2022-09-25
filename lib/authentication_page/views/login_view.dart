import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_shopcart/authentication_page/controllers/registration_controller.dart';
import 'package:project_shopcart/constends/box.dart';
import 'package:project_shopcart/widgets/custom_textformcard.dart';
import 'package:project_shopcart/widgets/custom_textform.dart';

class LoginView extends StatelessWidget {
  LoginView({
    Key? key,
  }) : super(key: key);

  final regiController = Get.find<RegistrationController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Form(
          key: regiController.formKey,
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
                          : "Enter valid email",
                  hintText: "Email"),
              Box().sizedBox1,
              const CustomTextForm(hintText: "Passwoard"),
              Box().sizedBox1,
              Container(
                width: 300,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(shape: const StadiumBorder()),
                    onPressed: () {
                      // Get.to(HomeScreen());
                      regiController.validated();
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
                  children: const [
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                    ),
                    Text('or'),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Container(
                  height: 50,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  topLeft: Radius.circular(20)),
                            ),
                            alignment: Alignment.center,
                            child: Image.asset(
                              "assets/google_logo.png",
                              height: 20,
                            )),
                      ),
                      Expanded(
                        flex: 5,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20),
                                topRight: Radius.circular(20)),
                          ),
                          alignment: Alignment.center,
                          child: const Text('Login with google',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
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
}
