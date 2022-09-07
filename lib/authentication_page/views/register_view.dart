import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_shopcart/authentication_page/views/verification_screen.dart';
import 'package:project_shopcart/widgets/custom_textformcard.dart';
import 'package:project_shopcart/widgets/custom_textform.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
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
              children: const [
                CustomTextForm(
                  width: 150,
                ),
                CustomTextForm(
                  width: 150,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomTextForm(),
            const SizedBox(
              height: 10,
            ),
            const CustomTextForm(),
            const SizedBox(
              height: 10,
            ),
            const CustomTextForm(),
            const SizedBox(
              height: 10,
            ),
            const CustomTextForm(),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 300,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                  onPressed: () {
                    Get.to(VerificationScreeen());
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
    );
  }
}
