import 'package:get/get.dart';
import 'package:project_shopcart/screens/cart_screen/api/delete_item.dart';
import 'package:project_shopcart/screens/cart_screen/controllers/fetch_cart_controller.dart';
import 'package:project_shopcart/screens/cart_screen/models/delete_item_model.dart';

class DeleteItemController extends GetxController {
  final fetchController = Get.find<FetchCartController>();

  RxBool? check = false.obs;
  deleteItemFromCart({String? itemId}) async {
    final DeleteItem responce =
        await DeleteCart().deleteItem(cartitem_Id: itemId);
    if (responce.status != null) {
      if (responce.status == true) {
        Get.showSnackbar(GetSnackBar(
          message: responce.message,
          duration: const Duration(seconds: 2),
        ));
      } else {
        Get.showSnackbar(GetSnackBar(
          message: responce.message.toString(),
          duration: const Duration(seconds: 2),
        ));
      }
    } else {
      Get.showSnackbar(GetSnackBar(
        message: responce.message.toString(),
        duration: const Duration(seconds: 2),
      ));
    }
  }
}
