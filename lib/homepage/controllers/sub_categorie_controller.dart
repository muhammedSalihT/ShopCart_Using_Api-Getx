import 'dart:developer';

import 'package:get/get.dart';
import 'package:project_shopcart/homepage/api/sub_categorie_api.dart';
import 'package:project_shopcart/homepage/models/sub_categorie_model.dart';

class SubCategorieController extends GetxController {
  // final mainCategorie = Get.find<MainCategoryController>();

  RxString categorieId = "TopWears".obs;

  @override
  void onInit() {
    log(categorieId.value);
    getSubCategorieData(categorieId: categorieId.value);
    super.onInit();
  }

  List<GetAllSubCategorie> subCategorieList = [];

  getSubCategorieData({required String categorieId}) async {
    final responce =
        await SubCategorieApi().getAllSubCategories(categorieId: categorieId);
    if (responce != null) {
      subCategorieList.clear();
      for (var element in responce.data!) {
        print('hii');
        subCategorieList.add(element);
      }
    }
    update();
  }
}
