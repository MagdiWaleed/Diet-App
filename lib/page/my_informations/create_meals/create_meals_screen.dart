import 'package:diet_app2/page/my_informations/create_meals/create_meals_controller.dart';
import 'package:diet_app2/page/my_informations/create_meals/create_meals_model.dart';
import 'package:diet_app2/page/my_informations/create_meals/create_single_meal_details/create_single_meal_details_screen.dart';
import 'package:diet_app2/theme/app_colors.dart';
import 'package:diet_app2/widget/custom_background.dart';
import 'package:diet_app2/widget/custom_complete_meal_card.dart';
import 'package:diet_app2/widget/custom_text.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';

class CreateMealsScreen extends StatelessWidget {
  const CreateMealsScreen({super.key});

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
        title: CustomText(title: "تصميماتي"),
      ),
      body: CustomBackground(
        child: GetBuilder<CreateMealsController>(
          init: CreateMealsController(),
          builder: (_controller) {
            return RefreshIndicator(
              onRefresh: () async {
                _controller.update();
              },
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FutureBuilder(
                    future: _controller.getMyCreatedMeals(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          final List<CreateMealsModel> data =
                              snapshot.data! as List<CreateMealsModel>;
                          return Column(
                            children: [
                              SizedBox(height: 100),
                              for (int i = 0; i < data.length; i++)
                                GestureDetector(
                                  onTap: () {
                                    Get.to(CreateSingleMealDetailsScreen(
                                        createMealsModel: data[i]));
                                  },
                                  child: CustomCompleteMealCard(
                                    name: data[i].name,
                                    calories: data[i].calories,
                                    carp: data[i].carp,
                                    createdByname: data[i].createdByname,
                                    fat: data[i].fat,
                                    protien: data[i].protein,
                                  ),
                                )
                            ],
                          );
                        } else {
                          return Column(
                            children: [
                              SizedBox(height: 100),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomText(
                                    title: "there are no data ",
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ],
                          );
                        }
                      } else {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 100),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  child: LoadingIndicator(
                                      indicatorType: Indicator.lineScale,
                                      colors: [AppColors.buttonColor],
                                      strokeWidth: 2,
                                      backgroundColor: Colors.transparent,
                                      pathBackgroundColor: Colors.transparent),
                                ),
                              ],
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Get.to(CreateSingleMealDetailsScreen());
          },
          label: CustomText(title: "صمم وجبة"),
          backgroundColor: AppColors.buttonColor),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
