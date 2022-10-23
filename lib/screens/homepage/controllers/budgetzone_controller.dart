import 'dart:developer';
import 'package:get/get.dart';
import 'package:project_shopcart/screens/homepage/api/buget_zone_api.dart';
import 'package:project_shopcart/screens/homepage/models/budget_model.dart';
import 'package:project_shopcart/screens/homepage/responsive/dimensions.dart';

class BudgetProductController extends GetxController {
  
  @override
  void onInit() {
    getBudegetData1(tappedCategorie.value);
    getBudegetData2(tappedCategorie.value);
    log("initialise budget");
    ever(tappedCategorie, getBudegetData1);
    ever(tappedCategorie, getBudegetData2);
    super.onInit();
  }


  List<Budget> budgetList1 = [];
  List<Budget> budgetList2 = [];

  getBudegetData1(String tappedCategorie) async {
    final responce = await BudgetApi().getBudgetProduct1(
        tappedCategorie: tappedCategorie, prize: 499.toString());
    if (responce != null) {
      log("get responce${responce.toString()}");
      budgetList1.clear();
      for (var element in responce.budget!) {
        budgetList1.add(element);
      }
    }
    update();
  }

  getBudegetData2(String tappedCategorie) async {
    final responce = await BudgetApi().getBudgetProduct2(
        tappedCategorie: tappedCategorie, prize: 699.toString());
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
