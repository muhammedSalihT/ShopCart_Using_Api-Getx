import 'package:flutter/cupertino.dart';
import 'package:project_shopcart/homepage/models/main_category_model.dart';

class MainCategoryProvider extends ChangeNotifier{

  List<MainCategoryModel> mainCategory = [
  MainCategoryModel(categoryName: "Shirts"),
  MainCategoryModel(categoryName: "Jeans"),
  MainCategoryModel(categoryName: "Tracksuits"),
  MainCategoryModel(categoryName: "Smart Watches"),
  MainCategoryModel(categoryName: "Shoes"),
  MainCategoryModel(categoryName: "Wallets"),
];
}

