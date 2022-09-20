import 'package:flutter/material.dart';

class HomeCategoryBanner extends StatelessWidget {
  const HomeCategoryBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * .05,
      child: const Padding(
        padding: EdgeInsets.only(top: 10.0, left: 5),
        child: Text(
          "Recently Viewed Items",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
