import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_shopcart/screens/cart_screen/controllers/addtocart_controller.dart';
import 'package:project_shopcart/screens/cart_screen/controllers/fetch_cart_controller.dart';
import 'package:project_shopcart/screens/homepage/controllers/budgetzone_controller.dart';
import 'package:project_shopcart/screens/homepage/controllers/home_controller.dart';
import 'package:project_shopcart/screens/homepage/controllers/main_category_controller.dart';
import 'package:project_shopcart/screens/homepage/responsive/tabbar.dart';
import 'package:project_shopcart/screens/homepage/widgets/custom_appbar.dart';
import 'package:project_shopcart/screens/product_description/controllers/product_controller.dart';

class HomeScreen extends GetView {
  HomeScreen({Key? key}) : super(key: key);
  final homeController = Get.put(HomeController());
  final mainCategoryController = Get.put(MainCategoryController());
  final budgetController = Get.find<BudgetProductController>();
  final productController = Get.put(ProductController());
  final cartController = Get.put(AddToCartController());
  final cartfetchController = Get.put(FetchCartController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(40), child: AppBarWidget()),
        body: GetBuilder<MainCategoryController>(
          builder: (mainCategoryController) {
            return DefaultTabController(
              length: mainCategoryController.mainCategoryList.length,
              child: NotificationListener<ScrollNotification>(
                onNotification: (scrollNotification) {
                  return scrollNotification is ScrollEndNotification
                      ? homeController.isVisible.value = true
                      : false;
                },
                child: NestedScrollView(
                  controller: homeController.scrollController,
                  floatHeaderSlivers: true,
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return [
                      SliverAppBar(
                        pinned: false,
                        snap: true,
                        floating: true,
                        elevation: 0,
                        backgroundColor: Colors.black,
                        titleSpacing: 5,
                        automaticallyImplyLeading: false,
                        centerTitle: false,
                        toolbarHeight: 60,
                        flexibleSpace: const FlexibleSpaceBar(),
                        title: LayoutBuilder(
                          builder: (context, constraints) {
                            if (constraints.maxWidth < 600) {
                              return Responsive.responsiveTabBar();
                            } else {
                              return Center(
                                  child: Responsive.responsiveTabBar());
                            }
                          },
                        ),
                      ),
                    ];
                  },
                  body: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: mainCategoryController.mainCategoryList.map(
                      (e) {
                        return mainCategoryController.getScreen(e.mainProduct);
                      },
                    ).toList(),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
