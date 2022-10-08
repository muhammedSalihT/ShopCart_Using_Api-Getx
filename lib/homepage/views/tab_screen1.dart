import 'dart:developer';
import 'package:animations/animations.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:project_shopcart/homepage/controllers/budgetzone_controller.dart';
import 'package:project_shopcart/homepage/controllers/sub_categorie_controller.dart';
import 'package:project_shopcart/homepage/controllers/trending_product_controller.dart';
import 'package:project_shopcart/widgets/home_category_banner.dart';
import 'package:project_shopcart/widgets/populer_items.dart';

class TabScreen1 extends StatelessWidget {
  TabScreen1({Key? key}) : super(key: key);

  final subCategorieController = Get.find<SubCategorieController>();
  final productController = Get.find<TrendingProductController>();
  final budgetProductController = Get.find<BudgetProductController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
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
        const HomeCategoryBanner(text: "Trending"),
        PopulerItems(),
        const Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: HomeCategoryBanner(text: "Categories"),
        ),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: const Color.fromARGB(255, 45, 44, 44),
                height: size.height * .61,
                child: GetBuilder<SubCategorieController>(
                    builder: (subCategorieController) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: GridView.builder(
                      itemCount:
                          subCategorieController.subCategorieList.length >= 9
                              ? 9
                              : subCategorieController.subCategorieList.length,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 10,
                              childAspectRatio: 0.86,
                              crossAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        log("${subCategorieController.subCategorieList[index].subCategorieName}");
                        return AnimationConfiguration.staggeredGrid(
                          position: 2,
                          columnCount: 3,
                          duration: const Duration(milliseconds: 800),
                          child: SlideAnimation(
                            child: FadeInAnimation(
                                curve: Curves.easeInCirc,
                                child: OpenContainer(
                                  // transitionType: ContainerTransitionType.fadeThrough,
                                  transitionDuration:
                                      const Duration(milliseconds: 600),
                                  closedShape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  closedElevation: 0.0,
                                  closedColor: Colors.grey,
                                  openShape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  openBuilder: (context, action) => Container(
                                    color: Colors.grey,
                                  ),
                                  closedBuilder: (context, action) => Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Expanded(
                                        child: Hero(
                                          tag: "$index",
                                          child: Image(
                                            image: NetworkImage(
                                                "${subCategorieController.subCategorieList[index].subCategorieImage}"),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          "${subCategorieController.subCategorieList[index].subCategorieName}",
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        );
                      },
                    ),
                  );
                }),
              ),
              const HomeCategoryBanner(text: "Budget-Zone"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.grey,
                      height: size.height * 0.25,
                      child: Column(
                        children: const [
                          Text("Under"),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      height: size.height * 0.25,
                      child: Swiper(
                        autoplay: true,
                        itemCount: budgetProductController.budgetList.length,
                        itemBuilder: (context, index) {
                          final data =
                              budgetProductController.budgetList[index];
                          return GridTile(
                            footer: Container(
                              height: 30,
                              color: const Color.fromARGB(96, 255, 255, 255),
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          "Orginal Prize${data.offerPrize.toString()}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                              decoration:
                                                  TextDecoration.lineThrough),
                                        ),
                                      )),
                                  Expanded(
                                    flex: 2,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Offer Prize${data.offerPrize.toString()}",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            child: GestureDetector(
                              onTap: () {},
                              child: Image.network(
                                  fit: BoxFit.cover, data.images!),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
