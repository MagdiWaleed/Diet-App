import 'dart:convert';

import 'package:diet_app2/model/complete_male_model.dart';
import 'package:diet_app2/model/user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService extends GetxService {
  Future<List<CompleteMaleModel>> getCompeletMealsList() async {
    List<CompleteMaleModel> completeMeals = [];
    final sh = await SharedPreferences.getInstance();
    if (sh.getStringList("myDiet") == null) {
      return completeMeals;
    } else {
      List<CompleteMaleModel> meals = sh
          .getStringList("myDiet")!
          .map((e) => CompleteMaleModel.fromJson(e))
          .toList();
      completeMeals = meals;
      print(completeMeals);
      return completeMeals;
    }
  }

  addCompeletMealToDiet(CompleteMaleModel completeMale) async {
    final sh = await SharedPreferences.getInstance();

    if (sh.getStringList("myDiet") == null) {
      List<CompleteMaleModel> myDiet = [completeMale];
      List<String> myDietConvreted =
          myDiet.map((e) => CompleteMaleModel.convertToJson(e)).toList();
      sh.setStringList("myDiet", myDietConvreted);
    } else {
      List<CompleteMaleModel> myDiet = sh
          .getStringList("myDiet")!
          .map((e) => CompleteMaleModel.fromJson(e))
          .toList();

      myDiet.add(completeMale);
      List<String> myDietConvreted =
          myDiet.map((e) => CompleteMaleModel.convertToJson(e)).toList();
      sh.setStringList("myDiet", myDietConvreted);
    }
  }

  updateCompeletMealToDiet(CompleteMaleModel completeMale, int index) async {
    final sh = await SharedPreferences.getInstance();

    if (sh.getStringList("myDiet") == null) {
      List<CompleteMaleModel> myDiet = [completeMale];
      List<String> myDietConvreted =
          myDiet.map((e) => CompleteMaleModel.convertToJson(e)).toList();
      sh.setStringList("myDiet", myDietConvreted);
    } else {
      List<CompleteMaleModel> myDiet = sh
          .getStringList("myDiet")!
          .map((e) => CompleteMaleModel.fromJson(e))
          .toList();

      myDiet[index] = completeMale;
      List<String> myDietConvreted =
          myDiet.map((e) => CompleteMaleModel.convertToJson(e)).toList();
      sh.setStringList("myDiet", myDietConvreted);
    }
  }

  updateAllCompleteMeals(List<CompleteMaleModel> meals) async {
    final sh = await SharedPreferences.getInstance();

    List<String> myDietConvreted =
        meals.map((e) => CompleteMaleModel.convertToJson(e)).toList();
    await sh.setStringList("myDiet", myDietConvreted);
  }

  deleteCompeletMealToDiet(int index) async {
    final sh = await SharedPreferences.getInstance();

    if (sh.getStringList("myDiet") == null) {
    } else {
      List<CompleteMaleModel> myDiet = sh
          .getStringList("myDiet")!
          .map((e) => CompleteMaleModel.fromJson(e))
          .toList();

      myDiet.removeAt(index);
      List<String> myDietConvreted =
          myDiet.map((e) => CompleteMaleModel.convertToJson(e)).toList();
      sh.setStringList("myDiet", myDietConvreted);
    }
  }
}
