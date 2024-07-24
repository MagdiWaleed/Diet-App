import 'package:diet_app2/appData.dart';
import 'package:diet_app2/model/complete_male_model.dart';
import 'package:diet_app2/page/current_diet/current_diet_model.dart';
import 'package:diet_app2/service/user_service.dart';
import 'package:diet_app2/theme/app_colors.dart';
import 'package:diet_app2/widget/custom_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurrentDietController extends GetxController {
  final controller = Get.put(UserService());

  //TODO try to make it optimal
  //TODO delete button and handel the delete operation
  List<CompleteMaleModel> compeletMealsModel = [];
  int numberOfMales = 0;
  // List<bool> ateMales = [];
  // List<List<bool>> ateComponent = [];
  List<ExpandableController> expandableController = [];
  List<num> caloriesperMale = [];
  double allCaloriesAchieved = 0, allProtein = 0, allCarp = 0, allFat = 0;
  final data = Get.put(UserService());
  @override
  void onInit() async {
    compeletMealsModel = await controller.getCompeletMealsList();
    numberOfMales = compeletMealsModel.length;
    for (int i = 0; i < numberOfMales; i++) {
      // ateMales.add(false);
      // List<bool> helperforComponent = [];
      // for (int j = 0; j < compeletMealsModel[i].components.length; j++) {
      // helperforComponent
      // .add(appData.getUserModel().myDietMales[i].components[j].isEaten);
      // }
      // ateComponent.add(helperforComponent);
      expandableController.add(ExpandableController());
      caloriesperMale.add(0);
    }
    update();
    super.onInit();
  }

  void finishedMale(int i) {
    final m = appData.getUserModel();
    m.myDietMales[i].isEaten = !m.myDietMales[i].isEaten;

    if (m.myDietMales[i].isEaten)
      for (int k = 0; k < m.myDietMales[i].components.length; k++)
        m.myDietMales[i].components[k].isEaten = true;

    if (!m.myDietMales[i].isEaten) {
      for (int k = 0; k < m.myDietMales[i].components.length; k++)
        m.myDietMales[i].components[k].isEaten = false;
    }

    _reCalculatTheWholeCalories();
    appData.setUserModel(m);
    data.updateCompeletMealToDiet(appData.getUserModel().myDietMales[i], i);
    update();
  }

  void expandThisMale(int i) {
    expandableController[i].expanded = !expandableController[i].expanded;
    update();
  }

  void finishedComponent(int i, int j) {
    final m = appData.getUserModel();

    m.myDietMales[i].components[j].isEaten =
        !m.myDietMales[i].components[j].isEaten;

    TheWholeMaleFinished(i, j);
    _reCalculatTheWholeCalories();
    appData.setUserModel(m);
    data.updateCompeletMealToDiet(appData.getUserModel().myDietMales[i], i);

    update();
  }

  void TheWholeMaleFinished(int i, int j) {
    final m = appData.getUserModel();
    bool isThereFalse = false;
    for (int k = 0; k < m.myDietMales[i].components.length; k++) {
      isThereFalse = m.myDietMales[i].components[k].isEaten == false;
      if (isThereFalse) break;
    }
    if (!isThereFalse)
      m.myDietMales[i].isEaten = true;
    else
      m.myDietMales[i].isEaten = false;
    appData.setUserModel(m);
    update();
  }

  void editThisComponent(int i, int j) {
    // double helperForCurrentWieght = 0;
    // compeletMealsModel[i].components[j].weight;
    // Get.defaultDialog(
    //     title: "ادخل الكمية الجديدة:",
    //     titleStyle: TextStyle(fontSize: 15, fontFamily: "Cairo"),
    //     content: Container(
    //       decoration: BoxDecoration(
    //         color: AppColors.buttonColor,
    //         borderRadius: BorderRadius.circular(
    //           12,
    //         ),
    //       ),
    //       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    //       child: TextField(
    //         style: TextStyle(
    //             color: Colors.white,
    //             fontFamily: "Cairo",
    //             fontWeight: FontWeight.bold),
    //         decoration: InputDecoration(
    //           border: OutlineInputBorder(
    //             borderRadius: BorderRadius.circular(8),
    //             borderSide:
    //                 BorderSide(color: AppColors.buttonColor, width: 0.5),
    //           ),
    //           enabledBorder: OutlineInputBorder(
    //             borderRadius: BorderRadius.circular(8),
    //             borderSide: BorderSide(color: AppColors.loading, width: 0.5),
    //           ),
    //           focusedBorder: OutlineInputBorder(
    //             borderRadius: BorderRadius.circular(13),
    //             borderSide:
    //                 BorderSide(color: AppColors.buttonColor, width: 0.5),
    //           ),
    //           label: Row(
    //             mainAxisSize: MainAxisSize.min,
    //             children: [
    //               SizedBox(width: 10),
    //               CustomText(title: "الكمية"),
    //               SizedBox(width: 2),
    //             ],
    //           ),
    //         ),
    //         textAlign: TextAlign.center,
    //         keyboardType: TextInputType.number,
    //         onChanged: (t) {
    //           if (t != "") {
    //             helperForCurrentWieght = double.parse(t);
    //           }
    //         },
    //       ),
    //     ),
    //     textConfirm: "حفظ",
    //     buttonColor: AppColors.buttonColor,
    //     textCancel: "الغاء",
    //     onConfirm: () {
    //       compeletMealsModel[i].components[j].setWeight(helperForCurrentWieght);
    //       Get.back();

    //       update();
    //     });
  }

  void _reCalculatTheWholeCalories() {
    allCaloriesAchieved = 0;
    allProtein = 0;
    allCarp = 0;
    allFat = 0;
    for (int i = 0; i < compeletMealsModel.length; i++) caloriesperMale[i] = 0;

    for (int i = 0; i < compeletMealsModel.length; i++) {
      for (int j = 0; j < compeletMealsModel[i].components.length; j++) {
        if (appData.getUserModel().myDietMales[i].components[j].isEaten) {
          caloriesperMale[i] = caloriesperMale[i] +
              num.parse(
                  compeletMealsModel[i].components[j].getCalories().toString());
          allProtein += compeletMealsModel[i].components[j].getProtein();
          allCarp += compeletMealsModel[i].components[j].getCarps();
          allFat += compeletMealsModel[i].components[j].getFats();
        }
      }
      allCaloriesAchieved += caloriesperMale[i];
    }
  }
}
