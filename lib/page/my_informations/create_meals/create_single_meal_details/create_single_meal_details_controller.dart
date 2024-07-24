import 'package:diet_app2/appData.dart';
import 'package:diet_app2/page/my_informations/create_meals/create_meals_controller.dart';
import 'package:diet_app2/page/my_informations/create_meals/create_meals_model.dart';
import 'package:diet_app2/page/single_male_screen/single_male_model.dart';
import 'package:diet_app2/service/create_meals_repository.dart';
import 'package:diet_app2/theme/app_colors.dart';
import 'package:diet_app2/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateSingleMealDetailsController extends GetxController {
  final data = Get.put(CreateMealsRepository());
  List<SingleMaleModel> components = [];
  TextEditingController controller = TextEditingController();
  double protein = 0, fats = 0, carps = 0, calories = 0;
  CreateMealsModel? createMealsModel;
  CreateSingleMealDetailsController({this.createMealsModel});
  @override
  void onInit() {
    if (createMealsModel != null) {
      components = createMealsModel!.meals;
      controller.text = createMealsModel!.name;
      protein = createMealsModel!.protein;
      fats = createMealsModel!.fat;
      carps = createMealsModel!.carp;
      calories = createMealsModel!.calories;
    } else {
      controller.text = "وجبة";
    }

    super.onInit();
  }

  void editThisComponent(int index) {
    double helperForCurrentWieght = 0;
    Get.defaultDialog(
        title: "ادخل الكمية الجديدة:",
        titleStyle: TextStyle(fontSize: 15, fontFamily: "Cairo"),
        content: Container(
          decoration: BoxDecoration(
            color: AppColors.buttonColor,
            borderRadius: BorderRadius.circular(
              12,
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: TextField(
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Cairo",
                fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:
                    BorderSide(color: AppColors.buttonColor, width: 0.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColors.loading, width: 0.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
                borderSide:
                    BorderSide(color: AppColors.buttonColor, width: 0.5),
              ),
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: 10),
                  CustomText(title: "الكمية"),
                  SizedBox(width: 2),
                ],
              ),
            ),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            onChanged: (t) {
              if (t != "") {
                helperForCurrentWieght = double.parse(t);
              }
            },
          ),
        ),
        textConfirm: "حفظ",
        buttonColor: AppColors.buttonColor,
        textCancel: "الغاء",
        onConfirm: () {
          components[index].setWeight(helperForCurrentWieght);
          calculatDetails();
          update();

          Get.back();
        });
  }

  void calculatDetails() {
    protein = 0;
    fats = 0;
    carps = 0;
    calories = 0;

    for (int i = 0; i < components.length; i++) {
      protein += components[i].getProtein();
      carps += components[i].getCarps();
      fats += components[i].getFats();
      calories += components[i].getCalories();
    }
  }

  void uploadMeal() {
    CreateMealsModel createMealsModel = CreateMealsModel(
        createdByname: appData.getUserModel().name,
        createdByid: appData.getUserModel().id,
        name: controller.text,
        meals: components,
        id: "newMeal", //it will change when u upload it
        calories: double.parse(calories.toString()),
        carp: double.parse(carps.toString()),
        fat: double.parse(fats.toString()),
        protein: double.parse(protein.toString()));
    try {
      data.addMeal(createMealsModel);
      Get.back();
      Get.find<CreateMealsController>().update();
      Get.snackbar("دن", "لقد تم انشاء الوجبة بنجاح");
    } catch (e) {
      Get.snackbar("error", e.toString());
    }
  }

  void updateMeal() {
    CreateMealsModel ddd = CreateMealsModel(
        createdByname: appData.getUserModel().name,
        createdByid: appData.getUserModel().id,
        name: controller.text,
        meals: components,
        id: createMealsModel!.id, //it will change when u upload it
        calories: double.parse(calories.toString()),
        carp: double.parse(carps.toString()),
        fat: double.parse(fats.toString()),
        protein: double.parse(protein.toString()));
    try {
      data.updateMeal(createMealsModel!);
      Get.back();
      Get.find<CreateMealsController>().update();
      Get.snackbar("دن", "لقد تم انشاء الوجبة بنجاح");
    } catch (e) {
      Get.snackbar("error", e.toString());
    }
  }
}
