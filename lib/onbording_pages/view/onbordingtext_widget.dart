import 'package:flutter/material.dart';

class OnBordingText extends StatelessWidget {
  const OnBordingText({
    Key? key,
    required this.textString,
    required this.size,
  }) : super(key: key);

  final String textString;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      textString,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w900,
        color: const Color.fromARGB(147, 0, 0, 0),
      ),
    );
  }
}
