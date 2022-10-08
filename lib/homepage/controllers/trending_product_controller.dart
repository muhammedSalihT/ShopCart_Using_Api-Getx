import 'dart:developer';
import 'package:get/get.dart';
import 'package:project_shopcart/homepage/api/Trending_prod_api.dart';
import 'package:project_shopcart/homepage/models/trending_model.dart';

class TrendingProductController extends GetxController {
  RxString categorieId = "63371b3851acef60a5f1f678".obs;

  @override
  void onInit() {
    log("initialise");
    getTrendingData(categorieId: categorieId.value);
    super.onInit();
  }

  List<Trending> trendingList = [];

  getTrendingData({required String categorieId}) async {
    final responce =
        await TrendingApi().getTrendingProduct(categorieId: categorieId);
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
