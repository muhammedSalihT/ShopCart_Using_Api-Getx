import 'package:dio/dio.dart';
import 'package:project_shopcart/api_const/api_urls.dart';
import 'package:project_shopcart/screens/cart_screen/models/cart_model.dart';

class FetchCartApi {
  Future<CartModel?> fetchAllCart({required String userId}) async {
    try {
      final responce = await Dio().get("${Url.baseUrl}${Url.getCart}$userId");

      if (responce.statusCode == 200) {
        final cartItemList = CartModel.fromJson(responce.data);
        return cartItemList;
      } else {
        return CartModel(massege: responce.statusMessage);
      }
    } on DioError catch (e) {
      return CartModel(massege: e.response.toString());
    } catch (e) {
      return CartModel(massege: e.toString());
    }
  }
}
