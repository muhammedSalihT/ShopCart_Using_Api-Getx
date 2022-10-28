import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:project_shopcart/api_const/api_urls.dart';
import 'package:project_shopcart/screens/product_description/models/product_model.dart';

class ProductApi {
  Future<ProductModel> getProduct({required String id}) async {
    try {
      log("${Url.baseUrl}${Url.product}/$id");
      Response responce = await Dio().get("${Url.baseUrl}${Url.product}/$id");
      if (responce.statusCode == 200) {
        log('message1');
        log("gfhghjhj ${responce.data}");
        return ProductModel.fromJson(responce.data);
      } else {
        return ProductModel(message: "Unknown error Occured");
      }
    } on DioError catch (e) {
      return ProductModel(message: e.response!.data.toString());
    } catch (e) {
      return ProductModel(message: e.toString());
    }
  }
}
