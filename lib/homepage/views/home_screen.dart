import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project_shopcart/homepage/controllers/main_category_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final mainCategoryController = MainCategoryController();

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
        body: DefaultTabController(
          length: mainCategoryController.mainCategoryList.length,
          child: CustomScrollView(
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
                title: TabBar(
                    labelColor: Colors.blue,
                    isScrollable: true,
                    tabs: mainCategoryController.mainCategoryList
                        .map((e) => Tab(
                              text: e.categoryName,
                            ))
                        .toList()),
              ),
              SliverToBoxAdapter(
                child: Container(
                    color: Colors.white,
                    height: size.height,
                    child: TabBarView(
                        physics: const BouncingScrollPhysics(),
                        children: mainCategoryController.mainCategoryList
                            .map((e) => mainCategoryController
                                .getScreen(e.categoryName))
                            .toList())),
              )
            ],
          ),
        ),
      ),
    );
  }
}
