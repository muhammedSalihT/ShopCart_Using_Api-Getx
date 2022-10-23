import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_shopcart/screens/homepage/controllers/trending_product_controller.dart';

class PopulerItems extends StatelessWidget {
  const PopulerItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child:
          GetBuilder<TrendingProductController>(builder: (trendingController) {
        return CarouselSlider(
          options: CarouselOptions(
            height: 200,
            enlargeCenterPage: true,
            disableCenter: true,
            autoPlay: true,
            viewportFraction: .65,
          ),
          items: List.generate(
            trendingController.trendingList.length,
            (index) => Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(trendingController
                            .trendingList[index].images!.img1
                            .toString())),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  child: Text(
                    trendingController.trendingList[index].productName
                        .toString(),
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        trendingController.trendingList[index].productPrize
                            .toString(),
                        style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 20,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 80,
                      ),
                      Text(
                        trendingController.trendingList[index].offerPrize
                            .toString(),
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
