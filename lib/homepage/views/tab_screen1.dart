import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:project_shopcart/widgets/home_category_banner.dart';
import 'package:project_shopcart/widgets/populer_items.dart';

class TabScreen1 extends StatelessWidget {
  const TabScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeCategoryBanner(text: "Recently Viewed Items"),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              height: 110,
              child: Row(
                children: List.generate(
                  5,
                  (index) => Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      height: 100,
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.1),
                            spreadRadius: 2,
                            blurRadius: 1,
                            // offset: const Offset(
                            //     2, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.green),
                              shape: BoxShape.circle,
                            ),
                            child: const CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage("assets/images.jpg"),
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          const Text(
                            "Apple Watches",
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const HomeCategoryBanner(text: "Popular"),
          const PopulerItems()
        ],
      ),
    );
  }
}
