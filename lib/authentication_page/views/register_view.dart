import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_shopcart/authentication_page/views/authentication_screen.dart';
import 'package:project_shopcart/homepage/views/home_screen.dart';
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
          height: 480,
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
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextForm(),
            SizedBox(
              height: 10,
            ),
            CustomTextForm(),
            SizedBox(
              height: 10,
            ),
            CustomTextForm(),
            SizedBox(
              height: 10,
            ),
            CustomTextForm(),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(HomeScreen());
                },
                child: Text("Register")),
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
