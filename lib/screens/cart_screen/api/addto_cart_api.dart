import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:project_shopcart/api_const/api_urls.dart';
import 'package:project_shopcart/screens/cart_screen/models/add_to_cart_model.dart';

class CartApi {
  Future<AddToCartModel> addToCart(
      {required String userId, required String productId}) async {
    try {
      final responce = await Dio().post("${Url.baseUrl}${Url.addToCart}",
          data: {"cartitem_Id": productId, "user_Id": userId});
      if (responce.statusCode == 200) {
        return AddToCartModel.fromJson(responce.data);
      } else {
        log(responce.statusMessage.toString());
        return AddToCartModel(msg: responce.statusMessage);
      }
    } on DioError catch (e) {
      // log(e.message.toString());
      log(e.response.toString());
      return AddToCartModel(msg: e.response.toString());
    } catch (e) {
      log('message');
      return AddToCartModel(msg: e.toString());
    }
  }
}
