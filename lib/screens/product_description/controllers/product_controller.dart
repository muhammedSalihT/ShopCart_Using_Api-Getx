import 'dart:developer';

import 'package:get/get.dart';
import 'package:project_shopcart/screens/product_description/api/product_api.dart';
import 'package:project_shopcart/screens/product_description/models/product_model.dart';

class ProductController extends GetxController {
  SingleProduct? product;

  getProductDetails(String productId) async {
    ProductModel responce = await ProductApi().getProduct(id: productId);
    if (responce.singleProduct != null) {
      log("message");
      log(responce.singleProduct.toString());
      product = responce.singleProduct!;
      update();
    }
  }
}
