import 'package:animations/animations.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:project_shopcart/homepage/controllers/budgetzone_controller.dart';
import 'package:project_shopcart/homepage/controllers/sub_categorie_controller.dart';
import 'package:project_shopcart/widgets/home_category_banner.dart';
import 'package:project_shopcart/widgets/populer_items.dart';

class TabScreen1 extends GetView {
  TabScreen1({Key? key}) : super(key: key);

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
            height: size.height * .15,
            child: Row(
              children: List.generate(
                5,
                (index) => Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Container(
                    height: size.height * .14,
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
                height: size.height * .346,
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
                                          child: subCategorieController
                                                  .subCategorieList.isEmpty
                                              ? const CircularProgressIndicator()
                                              : Image(
                                                  image: NetworkImage(
                                                      "${subCategorieController.subCategorieList[index].subImage!.data}"),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomLeft: Radius.circular(30)),
                        color: Colors.grey,
                      ),
                      height: size.height * 0.18,
                      width: size.width * .55,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Under",
                            style: TextStyle(
                                fontSize: 25, fontStyle: FontStyle.italic),
                          ),
                          const Text(
                            "Rs 699/*",
                            style: TextStyle(
                                fontSize: 25, fontStyle: FontStyle.italic),
                          ),
                          ElevatedButton(
                              onPressed: () {}, child: const Text("Shop Now"))
                        ],
                      ),
                    ),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                        child: Container(
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  bottomRight: Radius.circular(30))),
                          height: size.height * 0.18,
                          width: size.width * .45,
                          child: Swiper(
                            duration: 3000,
                            itemWidth: size.width * .45,
                            itemHeight: size.height * 0.18,
                            itemCount:
                                budgetProductController.budgetList2.length,
                            layout: SwiperLayout.TINDER,
                            autoplay: true,
                            itemBuilder: (context, index) {
                              return GridTile(
                                child: GestureDetector(
                                  onTap: () {},
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(30),
                                        bottomRight: Radius.circular(30)),
                                    child: GetBuilder<BudgetProductController>(
                                        builder: (budgetProductController) {
                                      return Image.network(
                                        budgetProductController
                                            .budgetList2[index].images!.img1
                                            .toString(),
                                        fit: BoxFit.cover,
                                      );
                                    }),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          topLeft: Radius.circular(30)),
                      child: SizedBox(
                        height: size.height * 0.18,
                        width: size.width * .4,
                        child: GetBuilder<BudgetProductController>(
                            builder: (budgetProductController) {
                          return Swiper(
                            duration: 3000,
                            itemWidth: size.width * .45,
                            itemHeight: size.height * 0.18,
                            itemCount:
                                budgetProductController.budgetList1.length,
                            layout: SwiperLayout.TINDER,
                            autoplay: true,
                            itemBuilder: (context, index) {
                              return GridTile(
                                child: GestureDetector(
                                  onTap: () {},
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        bottomLeft: Radius.circular(30)),
                                    child: Image.network(
                                      budgetProductController
                                          .budgetList1[index].images!.img1
                                          .toString(),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                bottomRight: Radius.circular(30))),
                        height: size.height * 0.18,
                        width: size.width * .6,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Under",
                              style: TextStyle(
                                  fontSize: 25, fontStyle: FontStyle.italic),
                            ),
                            const Text(
                              "Rs 499/*",
                              style: TextStyle(
                                  fontSize: 25, fontStyle: FontStyle.italic),
                            ),
                            ElevatedButton(
                                onPressed: () {}, child: const Text("Shop Now"))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
