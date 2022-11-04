import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:project_shopcart/screens/cart_screen/api/cart_fetch_api.dart';
import 'package:project_shopcart/screens/cart_screen/models/cart_model.dart';

class FetchCartController extends GetxController {
  @override
  void onInit() {
    getAllCart();
    super.onInit();
  }

  List<AllCart> cartList = [];

  getAllCart() async {
    const storage = FlutterSecureStorage();
    String userId = await storage.read(key: "user.id") ?? "";

    final responce = await FetchCartApi().fetchAllCart(userId: userId);

    if (responce != null) {
      cartList.clear();
      for (var element in responce.allCart!) {
        cartList.add(element);
      }
    }
    update();
  }
}
