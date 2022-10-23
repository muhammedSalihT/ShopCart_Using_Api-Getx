import 'dart:developer';
import 'package:get/get.dart';
import 'package:project_shopcart/screens/homepage/api/trending_prod_api.dart';
import 'package:project_shopcart/screens/homepage/models/trending_model.dart';
import 'package:project_shopcart/screens/homepage/responsive/dimensions.dart';

class TrendingProductController extends GetxController {

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
        .getTrendingProduct(tappedCategorie: tappedCategorie);
    if (responce != null) {
      trendingList.clear();
      for (var element in responce.trending!) {
        trendingList.add(element);
      }
      log(trendingList.toString());
      update();
    }
  }
}
