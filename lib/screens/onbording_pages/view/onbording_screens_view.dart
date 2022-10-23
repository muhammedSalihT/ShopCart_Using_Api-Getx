// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_shopcart/screens/authentication_page/views/authentication_screen.dart';
import 'package:project_shopcart/screens/onbording_pages/controller/onbording_controller.dart';
import 'package:project_shopcart/screens/onbording_pages/widgets/onbordingtext_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBordingScreen extends StatelessWidget {
  OnBordingScreen({Key? key}) : super(key: key);

  final _controller = OnBordingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _controller.pageController,
              onPageChanged: _controller.selectedPage,
              itemCount: _controller.onBordingPages.length,
              itemBuilder: (context, index) => SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(_controller.onBordingPages[index].lottieAsset),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: OnBordingText(
                        textString: _controller.onBordingPages[index].title,
                        size: 50,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 10),
                      child: OnBordingText(
                        textString:
                            _controller.onBordingPages[index].description,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: size.height * .09,
              left: size.width * .2,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      _controller.backwardAction();
                    },
                    child: Obx(
                      () {
                        return Icon(
                          Icons.arrow_left,
                          size: 80,
                          color: _controller.selectedPage.value > 0
                              ? Colors.black
                              : Colors.grey,
                        );
                      },
                    ),
                  ),
                  ...List.generate(
                    _controller.onBordingPages.length,
                    (index) => Obx(
                      () {
                        return Container(
                          margin: const EdgeInsets.all(4),
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _controller.selectedPage.value == index
                                  ? Colors.orange
                                  : Colors.grey),
                        );
                      },
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _controller.forwardAction();
                    },
                    child: Obx(
                      () {
                        return Icon(
                          Icons.arrow_right,
                          size: 80,
                          color: _controller.selectedPage.value < 2
                              ? Colors.black
                              : Colors.grey,
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          try {
            final SharedPreferences prefs =
                await SharedPreferences.getInstance();
            prefs.setBool("isScreen", true);
            Get.off(
              const AuthScreen(),
              transition: Transition.circularReveal,
              duration: const Duration(seconds: 1),
            );
          } catch (e) {
            e.toString();
            log(e.toString());
          }
        },
        label: const Text("Skip"),
      ),
    );
  }
}
