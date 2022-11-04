import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:project_shopcart/constends/sizes.dart';
import 'package:project_shopcart/screens/cart_screen/views/cart_screen.dart';
import 'package:project_shopcart/screens/global_screen/controllers/global_controller.dart';
import 'package:project_shopcart/screens/homepage/controllers/home_controller.dart';

class HidingBottomBar extends StatelessWidget {
  HidingBottomBar({
    Key? key,
  }) : super(key: key);

  final homeController = Get.find<HomeController>();
  final globalController = Get.find<GlobalController>();

  @override
  Widget build(BuildContext context) => Obx(() {
        return AnimatedContainer(
          duration: homeController.duration,
          height: homeController.isVisible.value ? bottomNavBarHeight : 0,
          child: homeController.isVisible.value
              ? Wrap(
                  children: [
                    Container(
                      height: bottomNavBarHeight,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25)),
                        color: Colors.black,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 20,
                            color: Colors.black.withOpacity(.1),
                          )
                        ],
                      ),
                      child: GNav(
                        tabMargin: const EdgeInsets.symmetric(horizontal: 5),
                        rippleColor: Colors.white,
                        gap: 8,
                        activeColor: Colors.white,
                        iconSize: 20,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                        duration: const Duration(milliseconds: 400),
                        tabBackgroundColor: Colors.grey.withOpacity(.5),
                        color: Colors.white,
                        tabs: [
                          const GButton(
                            icon: Icons.home,
                            text: 'Home',
                          ),
                          const GButton(
                            icon: Icons.search,
                            text: 'Search',
                          ),
                          GButton(
                            onPressed: () {
                              Get.to(() => CartScreen());
                            },
                            icon: Icons.shop,
                            text: 'Cart',
                          ),
                          const GButton(
                            icon: Icons.person,
                            text: 'Profile',
                          ),
                        ],
                        selectedIndex:
                            globalController.selectedIndex.value.toInt(),
                        onTabChange: (index) {
                          globalController.selectedIndex.value = index;
                        },
                      ),
                    ),
                  ],
                )
              : Container(
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width,
                ),
        );
      });
}
