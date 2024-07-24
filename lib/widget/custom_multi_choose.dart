import 'package:diet_app2/theme/app_colors.dart';
import 'package:diet_app2/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomMultiChoose extends StatelessWidget {
  CustomMultiChoose(
      {required this.title, this.textColor, this.backgroundColor});
  String title;
  Color? textColor, backgroundColor;
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 30,
          width: 80,
          decoration: BoxDecoration(
              color: Colors.transparent.withOpacity(0.7),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  color: backgroundColor ?? Colors.transparent, width: 0.5)),
          child: Container(
            alignment: Alignment.center,
            child: CustomText(
              title: title,
              color: textColor ?? Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
