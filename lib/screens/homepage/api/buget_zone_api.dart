import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:project_shopcart/api_const/api_urls.dart';
import 'package:project_shopcart/screens/homepage/models/budget_model.dart';

class BudgetApi {
  Future<GetBudgetModel?> getBudgetProduct1(
      {required String tappedCategorie, required String prize}) async {
    try {
      final responce =
          await Dio().get("${Url.baseUrl}${Url.budget}$tappedCategorie/$prize");
      log("${Url.baseUrl}${Url.budget}$tappedCategorie/$prize");
      if (responce.statusCode == 200) {
        final datalist = GetBudgetModel.fromJson(responce.data);
        log("=============================");
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

   Future<GetBudgetModel?> getBudgetProduct2(
      {required String tappedCategorie, required String prize}) async {
    try {
      final responce =
          await Dio().get("${Url.baseUrl}${Url.budget}$tappedCategorie/$prize");
      log("${Url.baseUrl}${Url.budget}$tappedCategorie/$prize");
      if (responce.statusCode == 200) {
        final datalist = GetBudgetModel.fromJson(responce.data);
        log("=============================");
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
