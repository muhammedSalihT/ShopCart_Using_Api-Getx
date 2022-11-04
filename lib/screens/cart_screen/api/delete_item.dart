import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:project_shopcart/api_const/api_urls.dart';
import 'package:project_shopcart/screens/cart_screen/models/delete_item_model.dart';

class DeleteCart {
  Future<DeleteItem> deleteItem({String? cartitem_Id}) async {
    log(cartitem_Id.toString());
    try {
      final responce =
          await Dio().delete("${Url.baseUrl}${Url.deleteCart}$cartitem_Id");
      log("${Url.baseUrl}${Url.deleteCart}$cartitem_Id");
      if (responce.statusCode == 200) {
        return DeleteItem(message: responce.statusMessage);
      } else {
        return DeleteItem(message: responce.statusMessage);
      }
    } on DioError catch (e) {
      log(e.response.toString());
      return DeleteItem(message: e.response.toString());
    } catch (e) {
      return DeleteItem(message: e.toString());
    }
  }
}
