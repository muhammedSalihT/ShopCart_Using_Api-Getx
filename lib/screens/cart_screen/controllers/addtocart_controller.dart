import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:project_shopcart/screens/cart_screen/api/cart_api.dart';
import 'package:project_shopcart/screens/cart_screen/models/add_to_cart_model.dart';

class AddToCartController extends GetxController {
  final storage = const FlutterSecureStorage();

  addToCart({required String productId}) async {
    String userId = await storage.read(key: "user.id") ?? "";

    final AddToCartModel responce =
        await CartApi().addToCart(userId: userId, productId: productId);
         if (responce.status != null) {
      if (responce.status == true) {
        Get.showSnackbar(GetSnackBar(
          message: responce.msg,
          duration: const Duration(seconds: 2),
        ));
      } else {
        Get.showSnackbar(GetSnackBar(
          message: responce.msg.toString(),
          duration: const Duration(seconds: 2),
        ));
      }
    } else {
      Get.showSnackbar(GetSnackBar(
        message: responce.msg.toString(),
        duration: const Duration(seconds: 2),
      ));
    }
  }
}
