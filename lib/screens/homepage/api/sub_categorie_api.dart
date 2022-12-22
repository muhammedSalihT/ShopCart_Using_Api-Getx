import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:project_shopcart/api_const/api_urls.dart';
import 'package:project_shopcart/screens/homepage/models/sub_categorie_model.dart';

class SubCategorieApi {
  Future<SubCategorieModel?> getAllSubCategories(
      {required String tappedCategorie}) async {
    try {
      final responce =
          await Dio().get(Url.baseUrl + Url.subCategorie + tappedCategorie);
      log(Url.baseUrl + Url.subCategorie + tappedCategorie);
      log("apin class${responce.toString()}");
      log(Url.baseUrl + Url.subCategorie + tappedCategorie);
      if (responce.statusCode == 200) {
        return SubCategorieModel.fromJson(responce.data);
      } else {
        return SubCategorieModel(msg: "Check your connectivity ");
      }
    } on DioError catch (e) {
      return SubCategorieModel(msg: e.response!.data.toString());
    } catch (e) {
      return SubCategorieModel(msg: e.toString());
    }
  }
}
