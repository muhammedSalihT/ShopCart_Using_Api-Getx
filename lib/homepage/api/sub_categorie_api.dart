import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:project_shopcart/api_const/api_urls.dart';
import 'package:project_shopcart/homepage/models/sub_categorie_model.dart';

class SubCategorieApi {
  Future<SubCategorieModel?> getAllSubCategories(
      {required String categorieId}) async {
    try {
      final responce =
          await Dio().get(Url.baseUrl + Url.subCategorie + categorieId);
      log('message');
      log(Url.baseUrl + Url.subCategorie + categorieId);
      if (responce.statusCode == 200) {
        return SubCategorieModel.fromJson(responce.data);
      } else {
        return SubCategorieModel(messege: "Unknown error occuired");
      }
    } on DioError catch (e) {
      log('dio error');
      log(e.response!.data.toString());
      return SubCategorieModel(messege: e.response!.data.toString());
    } catch (e) {
      print('catch error');
      print(e.toString());
      return SubCategorieModel(messege: e.toString());
    }
  }
}
