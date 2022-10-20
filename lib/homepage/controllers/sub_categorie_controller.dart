import 'dart:developer';

import 'package:get/get.dart';
import 'package:project_shopcart/homepage/api/sub_categorie_api.dart';
import 'package:project_shopcart/homepage/models/sub_categorie_model.dart';
import 'package:project_shopcart/homepage/responsive/dimensions.dart';

class SubCategorieController extends GetxController {
  // final mainCategorie = Get.find<MainCategoryController>();

  @override
  void onInit() {
    getSubCategorieData(tappedCategorie.value);
    ever(tappedCategorie, getSubCategorieData);
    super.onInit();
  }

  List<GetAllSubCategorie> subCategorieList = [];

  getSubCategorieData(String tappedCategorie) async {
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
    log(" null${responce.toString()}");
  }
}
