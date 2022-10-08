import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:project_shopcart/api_const/api_urls.dart';
import 'package:project_shopcart/homepage/models/budget_model.dart';

class BudgetApi {
  Future<GetBudgetModel?> getBudgetProduct(
      {required String categorieId}) async {
    try {
      final responce = await Dio().get(Url.baseUrl + Url.budget + categorieId);
      log(Url.baseUrl + Url.subCategorie + categorieId);
      if (responce.statusCode == 200) {
        final datalist = GetBudgetModel.fromJson(responce.data);
        log("======================");
        log(datalist.budget!.first.productName.toString());
        return datalist;
      } else {
        return GetBudgetModel(message: "Unknown error occuired");
      }
    } on DioError catch (e) {
      log('dio error');
      log(e.response!.data.toString());
      return GetBudgetModel(message: e.response!.data.toString());
    } catch (e) {
      return GetBudgetModel(message: e.toString());
    }
  }
}
