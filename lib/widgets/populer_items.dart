import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PopulerItems extends StatelessWidget {
  const PopulerItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 200,
          enlargeCenterPage: true,
          disableCenter: true,
          autoPlay: true,
          viewportFraction: .65,
        ),
        items: List.generate(
          5,
          (index) => Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      "assets/images.jpg",
                    ),
                  ),
                ),
              ),
              const Positioned(
                bottom: 20,
                child: Text(
                  "Smart Watch",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              const Positioned(
                bottom: 0,
                child: Text(
                  "Get It Rs 499/",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}