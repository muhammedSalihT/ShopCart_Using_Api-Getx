import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_shopcart/screens/homepage/api/search_api.dart';
import 'package:project_shopcart/screens/homepage/models/search_model.dart';

class SearchController extends GetxController {
  TextEditingController searchController = TextEditingController();

  List<SearchList> searchList = [];

  Future<List<SearchList>> searchingFunction() async {
    if (searchController.text.isNotEmpty) {
      getSearchDetails();
    }
    return searchList;
  }

  void getSearchDetails() async {
    final responce =
        await SearchApi().fetchSearchItem(searchText: searchController.text);
    if (responce != null) {
      searchList.clear();
      for (var element in responce.data!) {
        searchList.add(element);
      }
    }
    update();
  }
}
