import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:project_shopcart/screens/chechout_screen/views/checkout_screen.dart';
import 'package:project_shopcart/screens/homepage/widgets/home_category_banner.dart';
import 'package:project_shopcart/screens/product_description/controllers/product_controller.dart';

class ProductDescriptionScreen extends StatelessWidget {
  ProductDescriptionScreen({
    Key? key,
  }) : super(key: key);

  final productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<ProductController>(builder: (productController) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Get.back();
                  },
                ),
                title: const Text("Product Details"),
                actions: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                  Stack(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.shopify_sharp),
                      ),
                      Positioned(
                        right: 2,
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: const Center(
                            child: Text(
                              "2",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  )
                ],
                expandedHeight: 300,
                floating: false,
                pinned: true,
                snap: false,
                elevation: 2,
                backgroundColor: Colors.black,
                automaticallyImplyLeading: false,
                centerTitle: false,
                toolbarHeight: 60,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image(
                      image: NetworkImage(
                          productController.product!.images!.img1.toString())),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                        color: Colors.white,
                      ),
                      height: size.height * .88,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          const Center(
                            child: HomeCategoryBanner(
                                text: "Men half sleeve slim fit"),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Coustomer Rating:"),
                              RatingBar.builder(
                                itemSize: 20,
                                initialRating: 3.5,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                ignoreGestures: true,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Divider(
                              color: Colors.black.withOpacity(.3),
                              thickness: 3,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  width: double.infinity,
                                  color: Colors.grey,
                                  height: 120,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            "GRAB NOW!!!",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.red),
                                          ),
                                          Text("50%OFF")
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: const [
                                              Text(
                                                "Original Prize:",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ),
                                              ),
                                              Text(
                                                "1999/-",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.red),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: const [
                                              Text(
                                                "ShopCart Prize:",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ),
                                              ),
                                              Text(
                                                "999/-",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Color.fromARGB(
                                                        255, 24, 69, 26)),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: const [
                                              Text(
                                                "Savings Now:",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ),
                                              ),
                                              Text(
                                                "1000/-",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.red),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  color:
                                      const Color.fromARGB(255, 101, 183, 104),
                                  height: 100,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Icon(Icons.shopping_basket),
                                              Text("Delivery with\nin 10 days")
                                            ],
                                          ),
                                        ),
                                        Container(
                                          color: Colors.grey,
                                          width: 5,
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Icon(Icons.shopping_basket),
                                              Text(
                                                  "Cash on delivery\navailable")
                                            ],
                                          ),
                                        ),
                                        Container(
                                          color: Colors.grey,
                                          width: 5,
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Icon(Icons.shopping_basket),
                                              Text("7 days return\navailable")
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  height: 80,
                                  color: Colors.blue[200],
                                  child: ListTile(
                                    leading: const Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Icon(
                                        Icons.delivery_dining,
                                        size: 50,
                                      ),
                                    ),
                                    title: SizedBox(
                                      height: 20,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "FREE DELIVERY",
                                            style: TextStyle(
                                                color: Colors.green[900]),
                                          ),
                                          Container(
                                            width: 5,
                                            color: Colors.grey,
                                          ),
                                          const Expanded(
                                              child: Text("Delivery by 31 Oct"))
                                        ],
                                      ),
                                    ),
                                    subtitle: const Text(
                                      "Monday",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                                const HomeCategoryBanner(text: "Description"),
                                const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 100),
                                  child: Divider(
                                    thickness: 5,
                                    color: Colors.grey,
                                  ),
                                ),
                                const Text(
                                    "Dark themes reduce the luminance emitted by device screens, while still meeting minimum color contrast ratios. They help improve visual ergonomics by reducing eye strain, adjusting brightness to current lighting conditions, and facilitating screen use in dark environments — all while conserving battery power. Devices with OLED screens benefit from the ability to turn off black pixels at any time of day.")
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        bottomSheet: Container(
            height: 50,
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white38, width: 5)),
                    child: TextButton(
                        onPressed: () {}, child: const Text("ADD TO CART"))),
                Container(
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white38, width: 5)),
                    child: TextButton(
                        onPressed: () {
                          Get.to(() => CheckOutScreen(),
                              curve: Curves.bounceIn);
                        },
                        child: const Text("BUY NOW")))
              ],
            )),
      );
    });
  }
}
