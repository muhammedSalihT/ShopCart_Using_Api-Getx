import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project_shopcart/screens/homepage/controllers/budgetzone_controller.dart';

class BudgetWidget extends StatelessWidget {
  const BudgetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  "assets/under699.svg",
                ),
                const SizedBox(
                  width: 18,
                ),
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                    child: GetBuilder<BudgetProductController>(
                        builder: (budgetProductController) {
                      return SizedBox(
                        height: 133,
                        width: 200,
                        child: Swiper(
                          duration: 3000,
                          itemCount: budgetProductController.budgetList2.length,
                          layout: SwiperLayout.DEFAULT,
                          autoplay: true,
                          itemBuilder: (context, index) {
                            return GridTile(
                              child: GestureDetector(
                                  onTap: () {},
                                  child: Image.network(
                                    budgetProductController
                                        .budgetList2[index].images!.img1
                                        .toString(),
                                    fit: BoxFit.cover,
                                  )),
                            );
                          },
                        ),
                      );
                    }),
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
                Expanded(
                  child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(14),
                          topLeft: Radius.circular(14)),
                      child: GetBuilder<BudgetProductController>(
                          builder: (budgetProductController) {
                        return SizedBox(
                          height: 138,
                          width: 200,
                          child: Swiper(
                            itemWidth: 150,
                            itemHeight: 130,
                            itemCount:
                                budgetProductController.budgetList1.length,
                            layout: SwiperLayout.STACK,
                            autoplay: true,
                            itemBuilder: (context, index) {
                              return GridTile(
                                child: GestureDetector(
                                    onTap: () {},
                                    child: Image.network(
                                      budgetProductController
                                          .budgetList1[index].images!.img1
                                          .toString(),
                                      fit: BoxFit.cover,
                                    )),
                              );
                            },
                          ),
                        );
                      })),
                ),
                Expanded(
                  child: SvgPicture.asset(
                    "assets/under499.svg",
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
