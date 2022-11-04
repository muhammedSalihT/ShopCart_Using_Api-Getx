import 'dart:developer';

import 'package:get/get.dart';
import 'package:project_shopcart/screens/product_description/api/product_api.dart';
import 'package:project_shopcart/screens/product_description/models/product_model.dart';

class ProductController extends GetxController {
  SingleProduct? product;
  bool onLoad = false;
  List<String> productImage = [];

  getProductDetails(String productId) async {
    onLoad = true;
    ProductModel responce = await ProductApi().getProduct(id: productId);
    if (responce.singleProduct != null) {
      product = responce.singleProduct!;
      log(responce.singleProduct!.productName!);
      responce.singleProduct!.images!.toJson().forEach((key, value) {
        return productImage.add(value);
      });
      onLoad = false;
      update();
    }
  }
}
