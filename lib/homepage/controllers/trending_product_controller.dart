import 'dart:developer';
import 'package:get/get.dart';
import 'package:project_shopcart/homepage/api/Trending_prod_api.dart';
import 'package:project_shopcart/homepage/controllers/sub_categorie_controller.dart';
import 'package:project_shopcart/homepage/models/trending_model.dart';
import 'package:project_shopcart/homepage/responsive/dimensions.dart';

class TrendingProductController extends GetxController {
  final subController = Get.find<SubCategorieController>();

  @override
  void onInit() {
    log("initialise");
    getTrendingData(tappedCategorie.value);
    ever(tappedCategorie, getTrendingData);
    super.onInit();
  }

  List<Trending> trendingList = [];

  getTrendingData(String tappedCategorie) async {
    final responce = await TrendingApi()
        .getTrendingProduct(tappedCategorie:tappedCategorie);
    if (responce != null) {
      log("get responce${responce.toString()}");
      trendingList.clear();
      for (var element in responce.trending!) {
        trendingList.add(element);
      }
    }
    update();
  }
}
