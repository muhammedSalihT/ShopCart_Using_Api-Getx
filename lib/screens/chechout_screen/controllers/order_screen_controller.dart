import 'package:get/get.dart';

class OrderScreenController extends GetxController {
  List<String> sizeList = ["S", "M", "L"];
  RxString selectedSize = "S".obs;

  List<String> qtyList = ["1", "2", "3"];
  RxString selectedQty = "1".obs;
}
