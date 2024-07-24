import 'package:diet_app2/page/single_male_screen/single_male_model.dart';
import 'package:diet_app2/page/single_male_screen/single_male_screen.dart';

import 'package:diet_app2/theme/app_colors.dart';
import 'package:diet_app2/widget/custom_text.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomMealCard extends StatelessWidget {
  CustomMealCard({
    required this.name,
    required this.calories,
    this.isFavorite,
    super.key,
  });
  bool? isFavorite;
  final String name;
  final num calories;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 5, top: 5, right: 5, left: 5),
            decoration: BoxDecoration(
                color: Colors.transparent.withOpacity(0.8),
                borderRadius: BorderRadius.circular(5)),
            child: Stack(
              children: [
                Container(
                  height: 80,
                  width: double.infinity,
                  color: Colors.transparent,
                  child: Image.asset(
                    "asset/image/javier-santos-guzman-9MR78HGoflw-unsplash.jpg",
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Container(
                  height: 80,
                  width: double.infinity,
                  color: Colors.transparent.withOpacity(0.5),
                ),
                Row(
                  children: [
                    Container(
                      height: 70,
                      width: 50,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(title: name),
                        SizedBox(
                          height: 20,
                        ),
                        CustomText(
                          title: "المزيد من المعلومات",
                          color: Colors.grey,
                          size: 10,
                        )
                      ],
                    ),
                    const Spacer(),
                    CustomText(
                      title: double.parse(calories.toString()).toPrecision(2).toString(),
                      size: 20,
                    ),
                    CustomText(
                      title: "سعره",
                      size: 8,
                    ),
                    Icon(
                      Icons.local_fire_department_outlined,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 20,
                    )
                  ],
                ),
              ],
            ),
          ),
          isFavorite ?? false
              ? Container(
                  decoration: BoxDecoration(
                      color: AppColors.loading.withOpacity(0.6),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15))),
                  height: 20,
                  child: Row(
                    children: [
                      Expanded(
                        child: Icon(
                          Icons.favorite,
                          size: 15,
                          color: Colors.white54,
                        ),
                      ),
                    ],
                  ),
                )
              : Container(),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
