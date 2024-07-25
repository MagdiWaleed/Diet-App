import 'package:diet_app2/appData.dart';
import 'package:diet_app2/model/complete_male_model.dart';
import 'package:diet_app2/model/user_model.dart';
import 'package:diet_app2/page/current_diet/current_diet_controller.dart';
import 'package:diet_app2/page/current_diet/current_diet_model.dart';
import 'package:diet_app2/service/user_service.dart';
import 'package:diet_app2/theme/app_colors.dart';
import 'package:diet_app2/widget/custom_background.dart';
import 'package:diet_app2/widget/custom_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurrentDietScreen extends StatelessWidget {
  CurrentDietScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO USE CUSTOM LIST VIEW TO SHOW DIFFERENT UNBOUNDED SECROLL WITHOUT PROBLEMS

    return ExpandableNotifier(
      child: GetBuilder<CurrentDietController>(
          init: CurrentDietController(),
          builder: (_controller) {
            return RefreshIndicator(
              onRefresh: () async {
                _controller.update();
              },
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 100),
                    for (int i = 0; i < _controller.numberOfMales; i++)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            _controller.expandThisMale(i);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage("asset/image/javier-santos-guzman-9MR78HGoflw-unsplash.jpg"),fit: BoxFit.cover
                              ),
                                borderRadius: BorderRadius.circular(8),
                                color: appData
                                        .getUserModel()
                                        .myDietMales[i]
                                        .isEaten
                                    ? AppColors.doneColor
                                    : AppColors.buttonColor),
                            child: Expandable(
                              controller: _controller.expandableController[i],
                              collapsed: Column(
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: appData
                                            .getUserModel()
                                            .myDietMales[i]
                                            .isEaten,
                                        onChanged: (t) {
                                          _controller.finishedMale(i);
                                        },
                                        activeColor: AppColors.buttonColor,
                                      ),
                                      CustomText(
                                          title: _controller
                                              .compeletMealsModel[i].name
                                              .toString()),
                                      Spacer(),
                                      CustomText(
                                          title: _controller
                                              .compeletMealsModel[i].calories
                                              .toPrecision(2)
                                              .toString()),
                                      Icon(
                                        Icons.local_fire_department_outlined,
                                        color: appData
                                                .getUserModel()
                                                .myDietMales[i]
                                                .isEaten
                                            ? AppColors.buttonColor
                                            : AppColors.loading,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      )
                                    ],
                                  ),
                                  Divider(
                                    color: Colors.white,
                                  )
                                ],
                              ),
                              expanded: Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(width: 20),
                                      CustomText(
                                          title: _controller
                                              .compeletMealsModel[i].name
                                              .toString()),
                                      Spacer(),
                                      Checkbox(
                                        value: appData
                                            .getUserModel()
                                            .myDietMales[i]
                                            .isEaten,
                                        onChanged: (t) {
                                          _controller.finishedMale(i);
                                        },
                                        activeColor: AppColors.buttonColor,
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    color: AppColors.buttonColor,
                                    thickness: 1,
                                  ),
                                  SizedBox(height: 10),
                                  for (int j = 0;
                                      j <
                                          _controller.compeletMealsModel[i]
                                              .components.length;
                                      j++)
                                    GestureDetector(
                                      onLongPress: () {
                                        _controller.editThisComponent(i, j);
                                      },
                                      onTap: () {
                                        _controller.finishedComponent(i, j);
                                      },
                                      child: Container(
                                        color: appData
                                                .getUserModel()
                                                .myDietMales[i]
                                                .components[j]
                                                .isEaten
                                            ? AppColors.doneColor
                                                .withOpacity(0.5)
                                            : Colors.transparent
                                                .withOpacity(0.5),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Checkbox(
                                                  value: appData
                                                      .getUserModel()
                                                      .myDietMales[i]
                                                      .components[j]
                                                      .isEaten,
                                                  onChanged: (t) {
                                                    _controller
                                                        .finishedComponent(
                                                            i, j);
                                                  },
                                                  activeColor:
                                                      AppColors.buttonColor,
                                                ),
                                                CustomText(
                                                    title: _controller
                                                        .compeletMealsModel[i]
                                                        .components[j]
                                                        .name),
                                                Spacer(),
                                                CustomText(
                                                    title: _controller
                                                        .compeletMealsModel[i]
                                                        .components[j]
                                                        .weight.toPrecision(2)
                                                        .toString()),
                                                CustomText(
                                                  title: "جرام",
                                                  size: 12,
                                                ),
                                                Icon(
                                                  Icons
                                                      .multitrack_audio_outlined,
                                                  color: appData
                                                          .getUserModel()
                                                          .myDietMales[i]
                                                          .components[j]
                                                          .isEaten
                                                      ? AppColors.buttonColor
                                                      : AppColors.loading,
                                                ),
                                                SizedBox(width: 25)
                                              ],
                                            ),
                                            Divider(
                                              color: Colors.white,
                                              thickness: .1,
                                            ),
                                            Column(
                                              children: [
                                                SizedBox(
                                                  height: 0,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      child: CustomText(
                                                          title:
                                                              "الكالوريز:  "),
                                                    ),
                                                    Container(
                                                      child: CustomText(
                                                          title: _controller
                                                              .compeletMealsModel[
                                                                  i]
                                                              .components[j]
                                                              .getCalories()
                                                              .toPrecision(2)
                                                              .toString()),
                                                    ),
                                                    Icon(
                                                      Icons
                                                          .local_fire_department_outlined,
                                                      color: appData
                                                              .getUserModel()
                                                              .myDietMales[i]
                                                              .components[j]
                                                              .isEaten
                                                          ? AppColors
                                                              .buttonColor
                                                          : AppColors.loading,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 0,
                                                ),
                                                Divider(
                                                  thickness: 1,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(
                                                  height: 0,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      child: CustomText(
                                                          title: "بروتين:  "),
                                                    ),
                                                    Container(
                                                      child: CustomText(
                                                          title: _controller
                                                              .compeletMealsModel[
                                                                  i]
                                                              .components[j]
                                                              .getProtein()
                                                              .toPrecision(2)
                                                              .toString()),
                                                    ),
                                                    Icon(
                                                      Icons
                                                          .local_fire_department_outlined,
                                                      color: appData
                                                              .getUserModel()
                                                              .myDietMales[i]
                                                              .components[j]
                                                              .isEaten
                                                          ? AppColors
                                                              .buttonColor
                                                          : AppColors.loading,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 0,
                                                ),
                                                Divider(
                                                  thickness: 1,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(
                                                  height: 0,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      child: CustomText(
                                                          title:
                                                              "الكاربوهيدرات:  "),
                                                    ),
                                                    Container(
                                                      child: CustomText(
                                                          title: _controller
                                                              .compeletMealsModel[
                                                                  i]
                                                              .components[j]
                                                              .getCarps()
                                                              .toPrecision(2)
                                                              .toString()),
                                                    ),
                                                    Icon(
                                                      Icons
                                                          .local_fire_department_outlined,
                                                      color: appData
                                                              .getUserModel()
                                                              .myDietMales[i]
                                                              .components[j]
                                                              .isEaten
                                                          ? AppColors
                                                              .buttonColor
                                                          : AppColors.loading,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 0,
                                                ),
                                                Divider(
                                                  thickness: 1,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(
                                                  height: 0,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      child: CustomText(
                                                          title: "الدهون:  "),
                                                    ),
                                                    Container(
                                                      child: CustomText(
                                                          title: _controller
                                                              .compeletMealsModel[
                                                                  i]
                                                              .components[j]
                                                              .getFats()
                                                              .toPrecision(2)
                                                              .toString()),
                                                    ),
                                                    Icon(
                                                      Icons
                                                          .local_fire_department_outlined,
                                                      color: appData
                                                              .getUserModel()
                                                              .myDietMales[i]
                                                              .components[j]
                                                              .isEaten
                                                          ? AppColors
                                                              .buttonColor
                                                          : AppColors.loading,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 0,
                                                ),
                                                Divider(
                                                  thickness: 1,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(
                                                  height: 0,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  SizedBox(height: 10),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    decoration: BoxDecoration(
                                        color: AppColors.buttonColor
                                            .withOpacity(0.5),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CustomText(
                                          title: "الكالوريز المتحصلة:   ",
                                          size: 16,
                                        ),
                                        CustomText(
                                          title: _controller.caloriesperMale[i]
                                              .toDouble()
                                              .toPrecision(2)
                                              .toString(),
                                          fw: FontWeight.bold,
                                          size: 16,
                                        ),
                                        Icon(
                                          Icons.local_fire_department_outlined,
                                          color: AppColors.loading,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: AppColors.buttonColor,
                                    thickness: 1,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      margin: EdgeInsets.only(bottom: 10, left: 8, right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.buttonColor,
                      ),
                      child: Column(
                        children: [
                          CustomText(title: "الكالوريز المتحصلة:  "),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                title: _controller.allCaloriesAchieved
                                    .toPrecision(2)
                                    .toString(),
                                size: 15,
                                fw: FontWeight.bold,
                              ),
                              Icon(
                                Icons.local_fire_department_outlined,
                                color: AppColors.loading,
                              ),
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
                                    size: 12,
                                    title:
                                        "بروتين: ${(_controller.allProtein).toPrecision(2).toString()}"),
                              ),
                              Expanded(
                                child: CustomText(
                                    size: 12,
                                    title:
                                        "كارب: ${(_controller.allCarp).toPrecision(2).toString()}"),
                              ),
                              Expanded(
                                child: CustomText(
                                    size: 12,
                                    title:
                                        "فات: ${(_controller.allFat).toPrecision(2).toString()}"),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      margin: EdgeInsets.only(bottom: 10, left: 8, right: 8),
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.buttonColor.withOpacity(0.8),
                      ),
                      child: Column(
                        children: [
                          CustomText(
                            title: "الكالوريز المطلوبة:",
                            color: Colors.black,
                            fw: FontWeight.bold,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                title: appData
                                    .getUserModel()
                                    .caloriesGoal!
                                    .toPrecision(2)
                                    .toString(),
                                size: 15,
                                fw: FontWeight.bold,
                              ),
                              Icon(
                                Icons.local_fire_department_outlined,
                                color: AppColors.loading,
                              ),
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
                                    size: 12,
                                    title:
                                        "بروتين: ${appData.getUserModel().getProtein().toPrecision(2)}"),
                              ),
                              Expanded(
                                child: CustomText(
                                    size: 12,
                                    title:
                                        "كارب: ${appData.getUserModel().getCarp().toPrecision(2)}"),
                              ),
                              Expanded(
                                child: CustomText(
                                    size: 12,
                                    title:
                                        "فات: ${appData.getUserModel().getFat().toPrecision(2)}"),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
