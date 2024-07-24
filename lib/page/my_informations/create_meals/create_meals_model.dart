import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diet_app2/model/complete_male_model.dart';
import 'package:diet_app2/page/single_male_screen/single_male_model.dart';

class CreateMealsModel {
  final String createdByname;
  final String id;
  final String createdByid;
  final double calories, protein, carp, fat;
  final String name;
  List<SingleMaleModel> meals;
  CreateMealsModel(
      {required this.createdByname,
      required this.createdByid,
      required this.name,
      required this.meals,
      required this.calories,
      required this.carp,
      required this.fat,
      required this.id,
      required this.protein});
  factory CreateMealsModel.fromJson(String createdmealmodel) {
    final Map<String, dynamic> data = jsonDecode(createdmealmodel);
    final Map<String, dynamic> mealsMap = data["meals"];
    List<String> keys = mealsMap.keys.toList();

    List<SingleMaleModel> meals = [];
    for (String key in keys) {
      meals.add(SingleMaleModel.fromJson(mealsMap[key]));
    }
    return CreateMealsModel(
        createdByname: data["createdByname"],
        createdByid: data["createdByid"],
        name: data["name"],
        meals: meals,
        id: data["id"],
        calories: double.parse(data["calories"].toString()),
        carp: double.parse(data["carp"].toString()),
        fat: double.parse(data["fat"].toString()),
        protein: double.parse(data["protein"].toString()));
  }
  String convertToJson() {
    Map<String, dynamic> mealsHelper = {};

    for (int i = 0; i < meals.length; i++) {
      mealsHelper["$i"] = SingleMaleModel.convertToJson(meals[i]);
    }

    Map<String, dynamic> data = {
      "name": name,
      "createdByname": createdByname,
      "createdByid": createdByid,
      "meals": mealsHelper,
      "calories": calories,
      "protein": protein,
      "fat": fat,
      "carp": carp,
      "id":id,
    };
    return jsonEncode(data);
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> mealsHelper = {};

    for (int i = 0; i < meals.length; i++) {
      mealsHelper["$i"] = SingleMaleModel.convertToJson(meals[i]);
    }

    Map<String, dynamic> data = {
      "name": name,
      "createdByname": createdByname,
      "createdByid": createdByid,
      "meals": mealsHelper,
      "calories": calories,
      "protein": protein,
      "fat": fat,
      "carp": carp,
      "id":id,
    };
    return data;
  }

  factory CreateMealsModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    Map<String, dynamic> helper = data["meals"];
    List<String> keys = helper.keys.toList();
    List<SingleMaleModel> meals = [];
    for (String key in keys) {
      meals.add(SingleMaleModel.fromJson(helper[key]));
    }

    return CreateMealsModel(
        createdByname: data["createdByname"],
        createdByid: data["createdByid"],
        name: data["name"],
        meals: meals,
        id:document.id,
        calories: double.parse(data["calories"].toString()),
        carp: double.parse(data["carp"].toString()),
        fat: double.parse(data["fat"].toString()),
        protein: double.parse(data["protein"].toString()));
  }
}
