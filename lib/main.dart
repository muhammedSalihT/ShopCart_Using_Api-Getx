import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_shopcart/screens/splash_screen/views/splash_screen.dart';

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
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green),
          )),
          primarySwatch: Colors.blue,
        ),
        home: SpalshScreen());
  }
}
