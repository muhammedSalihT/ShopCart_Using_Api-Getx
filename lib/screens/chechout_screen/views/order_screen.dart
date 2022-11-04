import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_shopcart/screens/chechout_screen/controllers/checkout_screenController.dart';
import 'package:project_shopcart/screens/chechout_screen/controllers/order_screen_controller.dart';
import 'package:project_shopcart/screens/homepage/widgets/home_category_banner.dart';
import 'package:project_shopcart/screens/product_description/controllers/product_controller.dart';

class OrderScreen extends GetView<OrderScreenController> {
  OrderScreen({Key? key, this.index}) : super(key: key);

  final int? index;
  final chechOutController = Get.find<ChechOutScreenController>();
  final productController = Get.find<ProductController>();
  final orderController = Get.put(OrderScreenController());

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
                        child: Image.network(
                          productController.productImage.first,
                          fit: BoxFit.cover,
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
                            Text(
                              productController.product!.productName!,
                              style: const TextStyle(
                                  fontSize: 25,
                                  overflow: TextOverflow.ellipsis),
                            ),
                            SizedBox(
                              height: 40,
                              child: Row(
                                children: [
                                  Text(
                                    "\u{20B9}${productController.product!.productPrize!}",
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "\u{20B9}${productController.product!.offerPrize!}",
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "\u{20B9}${productController.product!.productPrize! - productController.product!.offerPrize!}\tSaved",
                                    style: const TextStyle(fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  const Text(
                                    "Size:\t",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  DropdownButtonHideUnderline(child: Obx(() {
                                    return DropdownButton(
                                      onChanged: (value) {
                                        orderController.selectedSize.value =
                                            value.toString();
                                      },
                                      value: orderController.selectedSize.value,
                                      items: orderController.sizeList
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem(
                                            value: value,
                                            child: Text(
                                              value,
                                              style:
                                                  const TextStyle(fontSize: 20),
                                            ));
                                      }).toList(),
                                    );
                                  }))
                                ],
                              ),
                            )
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
                            Obx(() {
                              return DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  onChanged: (value) {
                                    orderController.selectedQty.value =
                                        value.toString();
                                  },
                                  value: orderController.selectedQty.value,
                                  items: orderController.qtyList
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: const TextStyle(fontSize: 20),
                                        ));
                                  }).toList(),
                                ),
                              );
                            })
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
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Price(1 item)",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "\u{20B9}${productController.product!.productPrize!}/-",
                      style: const TextStyle(fontSize: 20),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Discount",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "-\u{20B9}${(productController.product!.productPrize)! - (productController.product!.offerPrize!)}/-",
                      style: const TextStyle(fontSize: 20),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Delivery Charges",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      productController.product!.deliveryCharge == 0
                          ? "Free Delivery"
                          : productController.product!.deliveryCharge!
                              .toString(),
                      style: const TextStyle(fontSize: 20, color: Colors.green),
                    )
                  ],
                ),
                const Divider(
                  thickness: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total amount",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "\u{20B9}${(productController.product!.offerPrize!) + (productController.product!.deliveryCharge != 0 ? productController.product!.deliveryCharge! : 0)}",
                      style: const TextStyle(fontSize: 25),
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
            Text(
              "\u{20B9}${(productController.product!.offerPrize!) + (productController.product!.deliveryCharge != 0 ? productController.product!.deliveryCharge! : 0)}",
              style: const TextStyle(
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
