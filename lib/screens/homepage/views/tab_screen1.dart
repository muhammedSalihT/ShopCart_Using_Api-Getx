import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_shopcart/screens/homepage/controllers/budgetzone_controller.dart';
import 'package:project_shopcart/screens/homepage/widgets/budget_widget.dart';
import '../widgets/home_category_banner.dart';
import '../widgets/recently_item_widgets.dart';
import '../widgets/sub_categorie_widget.dart';
import '../widgets/trending_item_widgets.dart';

class TabScreen1 extends GetView {
  TabScreen1({Key? key}) : super(key: key);

  final budgetController = Get.find<BudgetProductController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          const HomeCategoryBanner(text: "Recently Viewed Items"),
          RecentlyViewedItems(size: size),
          const HomeCategoryBanner(text: "Trending"),
          PopulerItems(),
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: HomeCategoryBanner(text: "Categories"),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SubCategorieWidget(size: size),
              const HomeCategoryBanner(text: "Budget-Zone"),
              const BudgetWidget()
            ],
          ),
        ],
      ),
    );
  }
}
