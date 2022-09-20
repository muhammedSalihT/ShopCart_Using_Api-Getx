import 'package:flutter/material.dart';

class TabScreen1 extends StatelessWidget {
  const TabScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        LimitedBox(
          maxHeight: 60,
          child: Row(
            children: const [],
          ),
        ),
        Container(
          height: 50,
          color: Colors.blue,
        )
      ],
    );
  }
}
