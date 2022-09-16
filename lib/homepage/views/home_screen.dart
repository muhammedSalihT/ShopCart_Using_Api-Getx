import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project_shopcart/homepage/controllers/main_category_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final tabController = TabController(length: 6, vsync: this);
  final mainCategoryController = MainCategoryController();

  @override
  Widget build(BuildContext context) {
    log('message');
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 12, 21, 25),
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
        body: DefaultTabController(
          length: mainCategoryController.mainCategoryList.length,
          child: Column(
            children: [
              LimitedBox(
                maxHeight: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: mainCategoryController.mainCategoryList.length,
                  itemBuilder: (context, index) {
                    log('$index');
                    return Row(
                      children: [
                        const SizedBox(width: 5),
                        Container(
                          color: Colors.orange,
                          height: 40,
                          width: 100,
                          child: TabBar(
                            tabs: [
                              
                            ],
                          ),
                        ),
                        const SizedBox(width: 5),
                      ],
                    );
                  },
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: const [
                    Text("sfbsbdisbdihbhi"),
                    Text("d"),
                    Text("cv"),
                    Text("dhd"),
                    Text("fhdh"),
                    Text("dfhdhhd")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
