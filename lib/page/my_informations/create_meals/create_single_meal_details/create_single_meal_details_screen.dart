import 'package:diet_app2/page/my_informations/create_meals/create_meals_model.dart';
import 'package:diet_app2/page/my_informations/create_meals/create_single_meal_details/add_component/add_component_screen.dart';
import 'package:diet_app2/page/my_informations/create_meals/create_single_meal_details/create_single_meal_details_controller.dart';
import 'package:diet_app2/theme/app_colors.dart';
import 'package:diet_app2/widget/custom_background.dart';
import 'package:diet_app2/widget/custom_text.dart';
import 'package:diet_app2/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateSingleMealDetailsScreen extends StatelessWidget {
  CreateSingleMealDetailsScreen({super.key, this.createMealsModel});
  CreateMealsModel? createMealsModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15))),
        backgroundColor: AppColors.buttonColor.withOpacity(1),
        centerTitle: true,
        title: CustomText(
            title: createMealsModel != null ? "عدل وجبتك" : "صمم وجبتك"),
      ),
      body: CustomBackground(
        child: GetBuilder<CreateSingleMealDetailsController>(
            init: CreateSingleMealDetailsController(
                createMealsModel: createMealsModel),
            builder: (controller) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: CustomTextField(
                        title: "اسم الوجبة",
                        controller: controller.controller,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.all(5),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.buttonColor),
                      child: CustomText(
                        title: "المكونات:",
                        size: 16,
                        fw: FontWeight.bold,
                      ),
                    ),
                    for (int i = 0; i < controller.components.length; i++)
                      Stack(
                        children: [
                          GestureDetector(
                            onLongPress: () {
                              controller.editThisComponent(i);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.buttonColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              margin:
                                  EdgeInsets.only(bottom: 5, right: 5, left: 5),
                              child: Column(
                                children: [
                                  CustomText(
                                    title: controller.components[i].name,
                                    size: 18,
                                  ),
                                  Divider(
                                    height: 10,
                                    thickness: 0.5,
                                    color: Colors.white,
                                  ),
                                  CustomText(
                                      title:
                                          "كارب:  ${controller.components[i].getCarps().toPrecision(2)}"),
                                  CustomText(
                                      title:
                                          "فات:  ${controller.components[i].getFats().toPrecision(2)}"),
                                  CustomText(
                                      title:
                                          "بروتين:  ${controller.components[i].getProtein().toPrecision(2)}"),
                                  CustomText(
                                      title:
                                          "كالوريز:  ${controller.components[i].getCalories().toPrecision(2)}")
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 5,
                            top: 0,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(8),
                                    topLeft: Radius.circular(8),
                                  ),
                                  color: AppColors.loading),
                              child: CustomText(
                                title:
                                    controller.components[i].weight.toString(),
                                fw: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Expanded(
                              child: ElevatedButton(
                            onPressed: () {
                              Get.to(AddComponentScreen());
                            },
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 20,
                            ),
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    AppColors.buttonColor),
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8)))),
                          )),
                        ],
                      ),
                    ),
                    GetBuilder<CreateSingleMealDetailsController>(
                        init: CreateSingleMealDetailsController(
                            createMealsModel: createMealsModel),
                        builder: (controller) {
                          return Container(
                            decoration: BoxDecoration(
                              color: AppColors.buttonColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            margin:
                                EdgeInsets.only(bottom: 5, right: 5, left: 5),
                            child: Column(
                              children: [
                                CustomText(
                                  title: "التوتال",
                                  size: 18,
                                ),
                                Divider(
                                  height: 10,
                                  thickness: 0.5,
                                  color: Colors.white,
                                ),
                                CustomText(
                                    title:
                                        "كارب:  ${controller.carps.toPrecision(2)}"),
                                CustomText(
                                    title:
                                        "فات:  ${controller.fats.toPrecision(2)}"),
                                CustomText(
                                    title:
                                        "بروتين:  ${controller.protein.toPrecision(2)}"),
                                CustomText(
                                    title:
                                        "كالوريز:  ${controller.calories.toPrecision(2)}")
                              ],
                            ),
                          );
                        }),
                  ],
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (createMealsModel != null) {
            Get.find<CreateSingleMealDetailsController>().updateMeal();
          } else {
            Get.find<CreateSingleMealDetailsController>().uploadMeal();
          }
        },
        label: CustomText(title: "دن"),
        backgroundColor: AppColors.buttonColor,
      ),
    );
  }
}
