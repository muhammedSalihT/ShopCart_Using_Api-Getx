import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project_shopcart/screens/homepage/views/home_screen.dart';
import 'package:project_shopcart/screens/search_screen/views/search_screen.dart';
import 'package:project_shopcart/screens/user_screen/views/user_screen.dart';

class GlobalController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  var pages = [
    HomeScreen(),
    const SearchScreen(),
    const SizedBox(),
    const UserScreen(),
  ].obs;
}
