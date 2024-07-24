import 'package:diet_app2/theme/app_colors.dart';
import 'package:diet_app2/widget/custom_text.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.title,
      this.ispassword,
      required this.controller,
      this.textInputType});
  final String title;
  bool? ispassword;
  final TextEditingController controller;
  TextInputType? textInputType;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.buttonColor,
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(
            color: Colors.white,
            fontFamily: "Cairo",
            fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13),
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: 10),
              CustomText(title: title),
              SizedBox(width: 2),
            ],
          ),
        ),
        textAlign: TextAlign.center,
        keyboardType: textInputType ?? TextInputType.name,
        obscureText: ispassword ?? false,
      ),
    );
  }
}
