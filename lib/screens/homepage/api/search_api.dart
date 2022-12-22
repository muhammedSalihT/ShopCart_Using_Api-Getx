import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:project_shopcart/api_const/api_urls.dart';
import 'package:project_shopcart/screens/homepage/models/search_model.dart';

class SearchApi {
  Future<SearchListModel?> fetchSearchItem({required String searchText}) async {
    try {
      final responce =
          await Dio().get("${Url.baseUrl}${Url.search}$searchText");
      if (responce.statusCode == 200) {
        return SearchListModel.fromJson(responce.data);
      } else {
        log(responce.statusMessage.toString());
        return SearchListModel(msg: responce.statusMessage);
      }
    } on DioError catch (e) {
      return SearchListModel(msg: e.response!.data.toString());
    } catch (e) {
      return SearchListModel(msg: e.toString());
    }
  }
}
