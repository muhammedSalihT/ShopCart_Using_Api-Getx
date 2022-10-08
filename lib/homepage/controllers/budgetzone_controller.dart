import 'dart:developer';
import 'package:get/get.dart';
import 'package:project_shopcart/homepage/api/buget_zone_api.dart';
import 'package:project_shopcart/homepage/models/budget_model.dart';

class BudgetProductController extends GetxController {
  RxString categorieId = "63371b3851acef60a5f1f678".obs;

  @override
  void onInit() {
    log("initialise budget");
    getBudgetData(categorieId: categorieId.value);
    super.onInit();
  }

  List<Budget> budgetList = [];

  getBudgetData({required String categorieId}) async {
    final responce =
        await BudgetApi().getBudgetProduct(categorieId: categorieId);
    if (responce != null) {
      log("get responce${responce.toString()}");
      budgetList.clear();
      for (var element in responce.budget!) {
        budgetList.add(element);
      }
    }
    update();
  }
}
