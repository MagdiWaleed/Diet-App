import 'package:diet_app2/page/my_informations/create_meals/create_meals_model.dart';
import 'package:diet_app2/theme/app_colors.dart';
import 'package:diet_app2/widget/custom_text.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCompleteMealCard extends StatelessWidget {
  const CustomCompleteMealCard({
    super.key,
    required this.name,
    required this.createdByname,
    required this.calories,
    required this.protien,
    required this.carp,
    required this.fat,
  });
  final String name;
  final String createdByname;
  final double calories;
  final double protien;
  final double carp;
  final double fat;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: Stack(
        children: [
          Container(
            height: 90,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                "asset/image/javier-santos-guzman-9MR78HGoflw-unsplash.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: 90,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.transparent.withOpacity(0.5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                CustomText(title: name),
                Row(
                  children: [
                    CustomText(
                      title: "المصمم: $createdByname",
                      size: 10,
                    ),
                    Spacer(),
                    CustomText(
                      title: "السعرات الحرارية:  ${calories.toPrecision(2)}",
                      size: 10,
                    ),
                    Icon(
                      Icons.local_fire_department_outlined,
                      size: 15,
                      color: AppColors.loading,
                    )
                  ],
                ),
                Divider(
                  height: 10,
                  thickness: 1,
                  color: Colors.white,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomText(
                          size: 12, title: "بروتين: ${protien.toPrecision(2)}"),
                    ),
                    Expanded(
                      child: CustomText(
                          size: 12, title: "كارب: ${carp.toPrecision(2)}"),
                    ),
                    Expanded(
                      child: CustomText(
                          size: 12, title: "فات: ${fat.toPrecision(2)}"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
