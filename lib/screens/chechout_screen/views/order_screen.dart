import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_shopcart/screens/chechout_screen/controllers/checkout_screenController.dart';
import 'package:project_shopcart/screens/homepage/widgets/home_category_banner.dart';

class OrderScreen extends StatelessWidget {
  OrderScreen({Key? key, this.index}) : super(key: key);

  final int? index;
  final chechOutController = Get.find<ChechOutScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.grey,
            child: Column(
              children: [
                SizedBox(
                  height: 120,
                  child: Row(
                    children: [
                      Expanded(
                        child: Image.asset(
                          "assets/images.jpg",
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "Men half sleeve slim fit",
                              style: TextStyle(
                                  fontSize: 25,
                                  overflow: TextOverflow.ellipsis),
                            ),
                            SizedBox(
                              height: 40,
                              child: Row(
                                children: const [
                                  Text(
                                    "\u{20B9}699",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "\u{20B9}489",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "\u{20B9}210 saved",
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                            const Text(
                              "Size:M",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                  child: Row(
                    children: [
                      const SizedBox(
                        child: Text(
                          "Delivery in:\t5-7days",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      const Expanded(
                        child: SizedBox(),
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            const Text(
                              "Qty:",
                              style: TextStyle(fontSize: 20),
                            ),
                            DropdownButton(
                              items: <String>[
                                'One',
                                'Two',
                                'Free',
                                'Four'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {},
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeCategoryBanner(text: "Price Deatils"),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Price(1 item)"),
                    Text(
                      "\u{20B9}1,599",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Discount"),
                    Text(
                      "-\u{20B9}600",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Delivery Charges"),
                    Text(
                      "free delivery",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Total amount"),
                    Text(
                      "\u{20B9}999",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
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
                chechOutController.tabController.animateTo(index! + 1);
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
}
