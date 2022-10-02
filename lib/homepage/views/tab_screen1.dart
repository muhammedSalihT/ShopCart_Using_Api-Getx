import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
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
          const PopulerItems(),
          const HomeCategoryBanner(text: "Categories"),
          // Expanded(
          //   child: GridView.builder(
          //     physics: const NeverScrollableScrollPhysics(),
          //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //         mainAxisSpacing: 30,
          //         crossAxisSpacing: 10,
          //         crossAxisCount: 3,
          //         childAspectRatio: 1 / 2),
          //     itemCount: 8,
          //     itemBuilder: (context, index) {
          //       return Container(
          //         height: 50,
          //         color: Colors.indigo,
          //       );
          //       // return LimitedBox(
          //       //   maxHeight: 300,
          //       //   child: Container(
          //       //     padding: const EdgeInsets.all(2),
          //       //     decoration: BoxDecoration(
          //       //         border: Border.all(
          //       //             width: 2,
          //       //             color: const Color.fromARGB(255, 211, 100, 255))),
          //       //     child: Container(
          //       //         padding: const EdgeInsets.all(3),
          //       //         decoration: BoxDecoration(
          //       //             border: Border.all(
          //       //                 color:
          //       //                     const Color.fromARGB(255, 211, 100, 255))),
          //       //         child: const Image(
          //       //             image: AssetImage("assets/images.jpg"))),
          //       //   ),
          //       // );
          //     },
          //   ),
          // )
          AnimationLimiter(
              child: Expanded(
            child: GridView.builder(
                itemCount: 8,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.86,
                    crossAxisSpacing: 30),
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredGrid(
                      position: 2,
                      columnCount: 3,
                      duration: const Duration(milliseconds: 800),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                            child: OpenContainer(
                          // transitionType: ContainerTransitionType.fadeThrough,
                          transitionDuration: const Duration(milliseconds: 600),
                          closedShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          closedElevation: 0.0,
                          closedColor: Colors.grey,
                          openShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          openBuilder: (context, action) => Container(),
                          closedBuilder: (context, action) => Container(
                            margin: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: const Hero(
                                      tag: "flower",
                                      child: Image(
                                        image: AssetImage("assets/images.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                    top: 8,
                                  ),
                                  child: Text(
                                    "saliun",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                      ));
                }),
          ))
        ],
      ),
    );
  }
}
