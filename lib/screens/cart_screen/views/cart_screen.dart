import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:project_shopcart/screens/cart_screen/controllers/delete_item_controller.dart';
import 'package:project_shopcart/screens/cart_screen/controllers/fetch_cart_controller.dart';
import 'package:project_shopcart/screens/global_screen/controllers/global_controller.dart';

class CartScreen extends StatelessWidget {
  CartScreen({
    Key? key,
  }) : super(key: key);

  final globalController = Get.find<GlobalController>();
  final cartDeleteController = Get.put(DeleteItemController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Cart"),
          leading: IconButton(
              onPressed: () {
                Get.back();
                globalController.selectedIndex.value = 0;
              },
              icon: const Icon(Icons.home)),
        ),
        body: GetBuilder<FetchCartController>(builder: (fetchController) {
          return ListView.builder(
            itemCount: fetchController.cartList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
                child: GestureDetector(
                  onLongPress: () {
                    Get.defaultDialog(
                        barrierDismissible: false,
                        middleText: "Do you want remove this from cart?",
                        textCancel: "No",
                        textConfirm: cartDeleteController.check!.value
                            ? "Wait..."
                            : "Yes",
                        onConfirm: () async {
                          cartDeleteController.check!.value == true;
                          await cartDeleteController.deleteItemFromCart(
                              itemId: fetchController
                                  .cartList[index].cartitemId!.id
                                  .toString());
                          await fetchController.getAllCart();
                          Navigator.of(context).pop();
                        });
                  },
                  child: Container(
                    height: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 177, 169, 169)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image(
                              image: NetworkImage(fetchController
                                  .cartList[index].cartitemId!.images!.img1!),
                              width: 100,
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              child: Column(
                                children: [
                                  Text(
                                    "gikufutfu",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: SizedBox(
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text("254",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineSmall),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text("254",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineSmall),
                                                ],
                                              ),
                                              RatingBar.builder(
                                                itemSize: 20,
                                                initialRating: 4,
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                itemCount: 5,
                                                ignoreGestures: true,
                                                itemPadding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 4.0),
                                                itemBuilder: (context, _) =>
                                                    const Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                                onRatingUpdate: (rating) {
                                                  print(rating);
                                                },
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 100,
                                        child: Column(
                                          children: [
                                            const Text(
                                              "Qty",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            Row(
                                              children: [
                                                IconButton(
                                                    onPressed: () {},
                                                    icon:
                                                        const Icon(Icons.add)),
                                                const Text("1"),
                                                Expanded(
                                                  child: IconButton(
                                                      onPressed: () {},
                                                      icon: const Icon(
                                                          Icons.remove)),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }),
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "Total:1000/-",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              ElevatedButton(onPressed: () {}, child: const Text("Check Out")),
            ],
          ),
        ));
  }
}
