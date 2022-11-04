import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_shopcart/constends/box.dart';
import 'package:project_shopcart/screens/chechout_screen/controllers/checkout_screenController.dart';
import 'package:project_shopcart/screens/chechout_screen/controllers/payment_controller.dart';
import 'package:project_shopcart/screens/homepage/widgets/home_category_banner.dart';
import 'package:project_shopcart/widgets/custom_textform.dart';

class AdressScreen extends StatelessWidget {
  AdressScreen({Key? key, this.index}) : super(key: key);
  final int? index;
  final chechOutController = Get.find<ChechOutScreenController>();
  final paymentController = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeCategoryBanner(text: "Add shipping adress"),
                Box().sizedBox1,
                const CustomTextForm(hintText: "Reciver Name"),
                Box().sizedBox1,
                const CustomTextForm(hintText: "Reciver Mobile Number"),
                Box().sizedBox1,
                const CustomTextForm(hintText: "Reciver pin code"),
                Box().sizedBox1,
                const CustomTextForm(hintText: "Reciver Adress"),
                Box().sizedBox1,
                Center(
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text("Save"))),
                const HomeCategoryBanner(text: "Use Default Adress"),
                ...List.generate(
                  3,
                  (index) => button(
                    index: index,
                    text: "dds",
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomSheet: Container(
        height: 80,
        color: Colors.black,
        child: Row(
          children: [
            const Text(
              "Total amount:",
              style: TextStyle(color: Colors.white),
            ),
            const Text(
              "\u{20B9}999",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const Expanded(child: SizedBox()),
            GestureDetector(
              onTap: () {
                paymentController.openCheckout();
              },
              child: Container(
                width: 100,
                height: 40,
                color: Colors.green,
                child: const Center(child: Text("Continue")),
              ),
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
      ),
    );
  }

  Widget button({required String text, required int index}) {
    return InkWell(
      splashColor: Colors.cyanAccent,
      onTap: () {},
      child: Column(
        children: [
          Container(
              height: 150,
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              color: Colors.grey,
              child: Row(
                children: [
                  Column(
                    children: const [
                      SizedBox(
                        width: 50,
                        child: Icon(Icons.circle_outlined),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                          child: Row(
                            children: const [
                              Text(
                                "salih",
                                style: TextStyle(fontSize: 25),
                              )
                            ],
                          ),
                        ),
                        const Text(
                          "bsvibisbfvibifvbihfbvf,calicut,india",
                          style: TextStyle(fontSize: 25),
                        ),
                        const Text(
                          "Mobile:978t76576",
                          style: TextStyle(fontSize: 25),
                        )
                      ],
                    ),
                  )
                ],
              )),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
