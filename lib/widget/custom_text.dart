import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText({required this.title, this.color, this.size, this.fw});
  final String title;
  Color? color;
  double? size;
  FontWeight? fw;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color ?? Colors.white,
        fontSize: size ?? 14,
        fontFamily: "Cairo",
        fontWeight: fw ?? FontWeight.normal,
      ),
    );
  }
}
