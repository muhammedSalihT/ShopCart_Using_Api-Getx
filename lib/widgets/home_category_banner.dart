import 'package:flutter/material.dart';

class HomeCategoryBanner extends StatelessWidget {
  const HomeCategoryBanner({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * .05,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 5),
        child: Text(
          text,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
