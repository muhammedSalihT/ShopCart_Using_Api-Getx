import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:project_shopcart/api_const/api_urls.dart';
import 'package:project_shopcart/homepage/models/main_category_model.dart';

class MainCategorieApi {
  Future<MainCategorieModel?> getAllMainCategories() async {
    try {
      final responce = await Dio().get(Url.baseUrl2 + Url.mainCategorie);
      if (responce.statusCode == 200) {
        return MainCategorieModel.fromJson(responce.data);
      } else {
        return MainCategorieModel(messege: "Unknown error occuired");
      }
    } on DioError catch (e) {
      log('dio error');
      log(e.response!.data.toString());
      return MainCategorieModel(messege:e.response!.data.toString());
    } catch (e) {
      print('catch error');
      print(e.toString());
      return MainCategorieModel(messege:e.toString());
    }
  }
}
