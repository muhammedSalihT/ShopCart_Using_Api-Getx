import 'dart:developer';
import 'package:get/get.dart';
import 'package:project_shopcart/screens/homepage/api/sub_categorie_api.dart';
import 'package:project_shopcart/screens/homepage/controllers/budgetzone_controller.dart';
import 'package:project_shopcart/screens/homepage/controllers/trending_product_controller.dart';
import 'package:project_shopcart/screens/homepage/models/sub_categorie_model.dart';
import 'package:project_shopcart/screens/homepage/responsive/dimensions.dart';

class SubCategorieController extends GetxController {
  final trendingController = Get.put(TrendingProductController());
  final budgetController = Get.put(BudgetProductController());

  @override
  void onInit() {
    getSubCategorieData(tappedCategorie.value);
    ever(tappedCategorie, getSubCategorieData);
    super.onInit();
  }

  List<GetAllSubCategorie> subCategorieList = [];

  getSubCategorieData(String tappedCategorie) async {
    trendingController.trendingList.clear();
    budgetController.budgetList1.clear();
    subCategorieList.clear();
    budgetController.budgetList2.clear();
    log("callledss");
    final responce = await SubCategorieApi()
        .getAllSubCategories(tappedCategorie: tappedCategorie);

    if (responce != null) {
      log("not null${responce.toString()}");
      subCategorieList.clear();
      for (var element in responce.data!) {
        print('hii');
        subCategorieList.add(element);
      }
      update();
    }
  }
}
