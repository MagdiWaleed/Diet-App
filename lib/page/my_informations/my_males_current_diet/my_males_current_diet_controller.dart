import 'package:diet_app2/appData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMalesCurrentDietController extends GetxController {
  late PageController pageController;
  double allCaloriesAchieved = 0, allFat = 0, allCarp = 0, allProtein = 0;

  @override
  void onInit() {
    pageController = PageController();
    calculat();
    super.onInit();
  }

  void calculat() {
    allCaloriesAchieved = 0;
    allFat = 0;
    allCarp = 0;
    allProtein = 0;
    for (int i = 0; i < appData.getUserModel().myDietMales.length; i++) {
      allCaloriesAchieved += appData.getUserModel().myDietMales[i].calories;
      allProtein += appData.getUserModel().myDietMales[i].protein;
      allCarp += appData.getUserModel().myDietMales[i].carps;
      allFat += appData.getUserModel().myDietMales[i].fats;
    }
    update();
  }

  void updateTheScreen() {
    update();
  }

  void changeToMales() {
    pageController.previousPage(
        duration: Duration(milliseconds: 5), curve: Curves.linear);
    update();
  }

  void changeToComponent() {
    pageController.nextPage(
        duration: Duration(milliseconds: 5), curve: Curves.linear);
    update();
  }
}
