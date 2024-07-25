import 'package:diet_app2/appData.dart';
import 'package:diet_app2/page/add_complete_meal/add_complete_meal_screen.dart';
import 'package:diet_app2/page/diet_details/diet_details_screen.dart';
import 'package:diet_app2/page/my_informations/my_males_current_diet/complete_male/complete_male_screen.dart';
import 'package:diet_app2/page/my_informations/my_males_current_diet/my_males_current_diet_controller.dart';
import 'package:diet_app2/service/user_service.dart';
import 'package:diet_app2/theme/app_colors.dart';
import 'package:diet_app2/widget/custom_meal_card.dart';
import 'package:diet_app2/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMalesCurrentDietScreen extends StatelessWidget {
  const MyMalesCurrentDietScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.buttonColor.withOpacity(1),
        centerTitle: true,
        title: CustomText(title: "وجباتي في الدايت الحالي"),
      ),
      body: GetBuilder<MyMalesCurrentDietController>(
          init: MyMalesCurrentDietController(),
          builder: (controller) {
            return RefreshIndicator(
              onRefresh: () async {
                controller.update();
              },
              child: PageView(
                controller: controller.pageController,
                children:[ 
                  ListView(
                  children: [
                    Divider(thickness: 1,
                    height: 2,
                    color: Colors.white,),
                    Row(
                      children: [
                        Expanded(
                          child:  GestureDetector(
                            onTap: () {
                                controller.changeToComponent();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(vertical: 15),
                              decoration: BoxDecoration(
                                  color: AppColors.buttonColor,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15))),
                              child: CustomText(title: "المكونات"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: appData.getUserModel().myDietMales.isEmpty
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomText(
                                  title: "there are no meals",
                                  color: Colors.black,
                                )
                              ],
                            )
                          : Container(
                              height: appData.getUserModel().myDietMales.length *
                                          100 >
                                      400
                                  ? 400
                                  : appData.getUserModel().myDietMales.length *
                                      100,
                              child: ReorderableListView(
                                onReorder: (oldIndex, newIndex) async {
                                  final _userservice = Get.put(UserService());
                                  if (newIndex > oldIndex) newIndex--;
                                  final data = appData.getUserModel();
                                  final item =
                                      data.myDietMales.removeAt(oldIndex);
                                  data.myDietMales.insert(newIndex, item);
                                  appData.setUserModel(data);
                                  controller.update();
                                  await _userservice.updateAllCompleteMeals(
                                      appData.getUserModel().myDietMales);
                                },
                                children: [
                                  for (int i = 0;
                                      i <
                                          appData
                                              .getUserModel()
                                              .myDietMales
                                              .length;
                                      i++)
                                    GestureDetector(
                                      key: ValueKey(
                                          appData.getUserModel().myDietMales[i]),
                                      onTap: () {
                                        Get.to(CompleteMaleScreen(
                                          maleIndex: i,
                                        ));
                                      },
                                      child: Stack(
                                        children: [
                                          CustomMealCard(
                                            name: appData
                                                .getUserModel()
                                                .myDietMales[i]
                                                .name,
                                            calories: appData
                                                .getUserModel()
                                                .myDietMales[i]
                                                .calories
                                                .toPrecision(2),
                                          ),
                                          Positioned(
                                              right: 20,
                                              top: 0,
                                              bottom: 10,
                                              child: Icon(
                                                Icons.reorder_sharp,
                                                color: Colors.white,
                                                size: 15,
                                              ))
                                        ],
                                      ),
                                    )
                                ],
                              ),
                            ),
                    ),
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
                                title: controller.allCaloriesAchieved
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
                                        "بروتين: ${(controller.allProtein).toPrecision(2).toString()}"),
                              ),
                              Expanded(
                                child: CustomText(
                                    size: 12,
                                    title:
                                        "كارب: ${(controller.allCarp).toPrecision(2).toString()}"),
                              ),
                              Expanded(
                                child: CustomText(
                                    size: 12,
                                    title:
                                        "فات: ${(controller.allFat).toPrecision(2).toString()}"),
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
                DietDetailsScreen(),
             ], ),
            );
          }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(AddCompleteMealScreen());
        },
        label: CustomText(title: "اضف وجبة"),
        backgroundColor: AppColors.buttonColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
