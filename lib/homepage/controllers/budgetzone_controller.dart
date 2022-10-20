import 'dart:developer';
import 'package:get/get.dart';
import 'package:project_shopcart/homepage/api/buget_zone_api.dart';
import 'package:project_shopcart/homepage/models/budget_model.dart';

class BudgetProductController extends GetxController {
  RxString categorieId = "TopWears".obs;
  String prize1 = 499.toString();
  String prize2 = 699.toString();

  @override
  void onInit() {
    log("initialise budget");
    getBudegetData1(categorieId: categorieId.value, prize1: prize1);
    getBudegetData2(categorieId: categorieId.value, prize2: prize2);
    super.onInit();
  }

  List<Budget> budgetList1 = [];
  List<Budget> budgetList2 = [];

  getBudegetData1({required String categorieId, required String prize1}) async {
    final responce = await BudgetApi()
        .getBudgetProduct(categorieId: categorieId, prize: prize1);
    if (responce != null) {
      log("get responce${responce.toString()}");
      budgetList1.clear();
      for (var element in responce.budget!) {
        budgetList1.add(element);
      }
    }
    update();
  }

  getBudegetData2({required String categorieId, required String prize2}) async {
    final responce = await BudgetApi()
        .getBudgetProduct(categorieId: categorieId, prize: prize2);
    if (responce != null) {
      log("get responce${responce.toString()}");
      budgetList2.clear();
      for (var element in responce.budget!) {
        budgetList2.add(element);
      }
    }
    update();
  }
}
