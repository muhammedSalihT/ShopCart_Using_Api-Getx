import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:project_shopcart/screens/homepage/controllers/sub_categorie_controller.dart';

class SubCategorieWidget extends StatelessWidget {
  const SubCategorieWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 112, 152, 116),
      child:
          GetBuilder<SubCategorieController>(builder: (subCategorieController) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: subCategorieController.subCategorieList.length >= 9
                ? 9
                : subCategorieController.subCategorieList.length,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                        transitionDuration: const Duration(milliseconds: 600),
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
                          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                  fontSize: 15,
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
    );
  }
}
