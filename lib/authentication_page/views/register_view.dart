import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_shopcart/authentication_page/controllers/registration_controller.dart';
import 'package:project_shopcart/authentication_page/controllers/verification_controller.dart';
import 'package:project_shopcart/authentication_page/views/verification_screen.dart';
import 'package:project_shopcart/widgets/custom_textformcard.dart';
import 'package:project_shopcart/widgets/custom_textform.dart';

class RegisterView extends StatelessWidget {
  RegisterView({
    Key? key,
  }) : super(key: key);

  final registrationController = Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registrationController.formKey,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(
            height: 30,
          ),
          CoustemTextFormCard(
            height: 450,
            childrens: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [],
              ),
              CustomTextForm(
                  validator: (value) {
                    value != null && GetUtils.isEmail(value.trim())
                        ? null
                        : "enter name";
                    return null;
                  },
                  controller: registrationController.nameController,
                  hintText: "Name"),
              const SizedBox(
                height: 10,
              ),
              CustomTextForm(
                  controller: registrationController.reigsterEmailControll,
                  hintText: "Email"),
              const SizedBox(
                height: 10,
              ),
              CustomTextForm(
                  controller: registrationController.numberControlletr,
                  hintText: "Phone Number"),
              const SizedBox(
                height: 10,
              ),
              CustomTextForm(
                  controller: registrationController.passwordController,
                  hintText: "Passwoard"),
              const SizedBox(
                height: 10,
              ),
              CustomTextForm(
                  controller: registrationController.confirmPasswordController,
                  hintText: "Confirm passwoard"),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 300,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(shape: const StadiumBorder()),
                    onPressed: () {
                      registrationController.validated();
                      // Get.to(VerificationScreeen());
                    },
                    child: const Text("Register")),
              ),
            ],
          ),
          Visibility(
            visible: MediaQuery.of(context).viewInsets.bottom != 0,
            child: const SizedBox(
              height: 250,
            ),
          )
        ],
      ),
    );
  }
}
