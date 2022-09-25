import 'package:flutter/material.dart';

class CoustemTextFormCard extends StatelessWidget {
  const CoustemTextFormCard({
    Key? key,
    required this.childrens,
    required this.height,
  }) : super(key: key);

  final List<Widget> childrens;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children:
                  List.generate(childrens.length, (index) => childrens[index]),
            ),
          ),
        ),
      ),
    );
  }
}
