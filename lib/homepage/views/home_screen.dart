import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_shopcart/homepage/controllers/main_category_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final mainCategoryController = MainCategoryController();

  List<Widget> pages = [
    Container(
      height: 200,
      color: Colors.white38,
    ),
    Container(
      height: 200,
      color: Colors.indigo,
    ),
    Container(
      height: 200,
      color: Colors.grey,
    ),
    Container(
      height: 200,
      color: Colors.yellow,
    ),
    Container(
      color: Colors.indigo,
    ),
    Container(
      color: Colors.pink,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    log('message');
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          title: const Text("ShopCart"),
          actions: [
            IconButton(
              icon: const Icon(Icons.record_voice_over_outlined),
              onPressed: () {},
            )
          ],
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              titleSpacing: 5,
              automaticallyImplyLeading: false,
              centerTitle: false,
              toolbarHeight: 60,
              floating: true,
              flexibleSpace: const FlexibleSpaceBar(),
              title: LimitedBox(
                maxHeight: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: mainCategoryController.mainCategoryList.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            mainCategoryController.currentPage.value = index;
                          },
                          child: Obx(
                            () {
                              return Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.blue),
                                    color: mainCategoryController
                                                .currentPage.value ==
                                            index
                                        ? Colors.cyan
                                        : Colors.grey),
                                height: 40,
                                width: 100,
                                child: Text(mainCategoryController
                                    .mainCategoryList[index].categoryName),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            SliverAppBar(
                titleSpacing: 5,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                toolbarHeight: size.height,
                title: Obx(() {
                  return pages[mainCategoryController.currentPage.value];
                })
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Container(
                //       color: Colors.orange,
                //       height: 200,
                //     ),
                //     Container(
                //       height: 200,
                //       color: Colors.yellow,
                //     )
                //   ],
                // ),
                )
          ],
        ),
      ),
    );
  }
}
