import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_shopcart/screens/homepage/controllers/home_controller.dart';
import 'package:project_shopcart/screens/homepage/controllers/serach_controller.dart';
import 'package:project_shopcart/screens/search_screen/views/search_screen.dart';

class AppBarWidget extends GetWidget<HomeController> {
  AppBarWidget({
    Key? key,
  }) : super(key: key);

  final searchController = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.black,
      title: GetBuilder<HomeController>(builder: (homeController) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "ShopCart",
              style: TextStyle(fontSize: 23),
            ),
            const SizedBox(
              width: 50,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Get.to(() => const SearchScreen(),
                      transition: Transition.downToUp);
                },
                child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 1, color: Colors.white)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(Icons.search),
                        Text(
                          "search products",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    )),
              ),
            )

            // IconButton(
            //   icon: const Icon(Icons.search),
            //   onPressed: () {
            //     controller.onSearchButtonPress();
            //   },
            // ),
            // controller.isSearchVisibile
            //     ? Expanded(
            //         child: TextFormField(
            //           controller: searchController.searchController,
            //           autofocus: true,
            //           style: const TextStyle(color: Colors.white, fontSize: 23),
            //           decoration: InputDecoration(
            //               contentPadding:
            //                   const EdgeInsets.symmetric(horizontal: 10),
            //               hintStyle: const TextStyle(color: Colors.white),
            //               hintText: "Search here..",
            //               enabledBorder: const OutlineInputBorder(
            //                 borderSide:
            //                     BorderSide(color: Colors.blue, width: 2.0),
            //                 borderRadius:
            //                     BorderRadius.all(Radius.circular(10.0)),
            //               ),
            //               focusColor: Colors.blue,
            //               border: OutlineInputBorder(
            //                   borderRadius: BorderRadius.circular(10))),
            //         ),
            //       )
            //     : const
          ],
        );
      }),
    );
  }
}
