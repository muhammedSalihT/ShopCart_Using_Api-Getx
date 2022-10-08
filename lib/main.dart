import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_shopcart/splash_screen/views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.black),
          primarySwatch: Colors.blue,
        ),
        home: SpalshScreen());
  }
}
