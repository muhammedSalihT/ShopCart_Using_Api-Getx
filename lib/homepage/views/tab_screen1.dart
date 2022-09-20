import 'package:flutter/material.dart';

class TabScreen1 extends StatelessWidget {
  const TabScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 50,
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}
