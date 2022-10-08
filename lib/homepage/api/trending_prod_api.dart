import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:project_shopcart/api_const/api_urls.dart';
import 'package:project_shopcart/homepage/models/trending_model.dart';

class TrendingApi {
  Future<GetTrendingModel?> getTrendingProduct(
      {required String categorieId}) async {
    try {
      final responce =
          await Dio().get(Url.baseUrl + Url.trending + categorieId);
      log(Url.baseUrl + Url.subCategorie + categorieId);
      if (responce.statusCode == 200) {
        final datalist = GetTrendingModel.fromJson(responce.data);
        log("======================");
        log(datalist.trending!.first.productName.toString());
        return datalist;
      } else {
        return GetTrendingModel(message: "Unknown error occuired");
      }
    } on DioError catch (e) {
      log('dio error');
      log(e.response!.data.toString());
      return GetTrendingModel(message: e.response!.data.toString());
    } catch (e) {
      return GetTrendingModel(message: e.toString());
    }
  }
}
