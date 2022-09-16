import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:project_shopcart/homepage/models/main_category_model.dart';

class MainCategoryProvider extends GetxController {
  List<MainCategoryModel> mainCategory = [
    MainCategoryModel(categoryName: "Shirts"),
    MainCategoryModel(categoryName: "Jeans"),
    MainCategoryModel(categoryName: "Tracksuits"),
    MainCategoryModel(categoryName: "Smart Watches"),
    MainCategoryModel(categoryName: "Shoes"),
    MainCategoryModel(categoryName: "Wallets"),
  ];
}
