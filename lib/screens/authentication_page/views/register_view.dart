import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_shopcart/constends/box.dart';
import 'package:project_shopcart/screens/authentication_page/controllers/registration_controller.dart';
import 'package:project_shopcart/widgets/custom_textformcard.dart';
import 'package:project_shopcart/widgets/custom_textform.dart';

class RegisterView extends StatelessWidget {
  RegisterView({
    Key? key,
  }) : super(key: key);

  final registrationController = Get.find<RegistrationController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Box().sizedBox1,
        Form(
          key: registrationController.formKey,
          child: CoustemTextFormCard(
            height: 0,
            childrens: [
              const SizedBox(
                height: 20,
              ),
              CustomTextForm(
                  validator: (value) =>
                      GetUtils.isUsername(value!) ? null : "Enter Correct Name",
                  controller: registrationController.nameController,
                  hintText: "Name"),
              Box().sizedBox1,
              CustomTextForm(
                  validator: (value) =>
                      GetUtils.isEmail(value!) ? null : "Enter Correct Email",
                  controller: registrationController.reigsterEmailControll,
                  hintText: "Email"),
              Box().sizedBox1,
              CustomTextForm(
                  validator: (value) => GetUtils.isLengthBetween(value, 10, 10)
                      ? null
                      : "Enter Correct Phone Number",
                  controller: registrationController.numberControlletr,
                  hintText: "Phone Number"),
              Box().sizedBox1,
              CustomTextForm(
                  validator: (value) => GetUtils.isLengthBetween(value, 3, 10)
                      ? null
                      : "Enter Correct Password",
                  controller: registrationController.passwordController,
                  hintText: "Passwoard"),
              Box().sizedBox1,
              CustomTextForm(
                  validator: (value) => GetUtils.isLengthBetween(value, 3, 10)
                      ? null
                      : "Re-Enter Password",
                  controller: registrationController.confirmPasswordController,
                  hintText: "Confirm password"),
              Box().sizedBox1,
              Container(
                width: 300,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(shape: const StadiumBorder()),
                    onPressed: () {
                      registrationController.checkRegister();
                      // Get.to(VerificationScreeen());
                    },
                    child: const Text("Register")),
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
