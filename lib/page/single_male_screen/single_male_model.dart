import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class SingleMaleModel {
  String name;
  String category;
  double protein;
  double fats;
  double carps;
  String id;
  double weight;
  bool isEaten;
  Map<String, num>? Vitamins, Fiber_M;
  String? image;
  double? calories;
  double? price;
  String? notes;
  SingleMaleModel({
    required this.name,
    required this.category,
    required this.protein,
    required this.fats,
    required this.carps,
    required this.id,
    required this.weight,
    required this.isEaten,
    this.notes,
    this.Vitamins,
    this.Fiber_M,
    this.image,
    this.calories,
    this.price,
  }) {
    calories = (getProtein() * 4) + (getCarps() * 4) + (getFats() * 9);
  }

  factory SingleMaleModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return SingleMaleModel(
        name: data["name"],
        category: data["category"],
        protein: double.parse(data["protein"].toString()),
        fats: double.parse(data["fat"].toString()),
        carps: double.parse(data["carp"].toString()),
        notes: data["note"],
        weight: 100,
        isEaten: false,
        id: document.id);
  }

  static String convertToJson(SingleMaleModel singleMale) {
    Map<String, dynamic> meal = {
      "id": singleMale.id,
      "name": singleMale.name,
      "protein": singleMale.protein,
      "fats": singleMale.fats,
      "calories": singleMale.calories,
      "carps": singleMale.carps,
      "weight": singleMale.weight,
      "note": singleMale.notes,
      "isEaten": singleMale.isEaten == true ? "true" : "false",
    };

    return jsonEncode(meal);
  }

  factory SingleMaleModel.fromJson(String m) {
    Map<String, dynamic> singlemale = jsonDecode(m);
    return SingleMaleModel(
        name: singlemale["name"],
        category: "p",
        protein: double.parse(singlemale["protein"].toString()),
        fats: double.parse(singlemale["fats"].toString()),
        carps: double.parse(singlemale["carps"].toString()),
        weight: singlemale["weight"] == null
            ? 100
            : double.parse(singlemale["weight"].toString()),
        id: singlemale["id"],
        notes: singlemale["note"],
        isEaten: singlemale["isEaten"] == null
            ? false
            : singlemale["isEaten"] == "true"
                ? true
                : false);
  }

  void setWeight(double w) {
    weight = w;
  }

  double getProtein() {
    return protein * weight / 100;
  }

  double getCalories() {
    return  (getProtein()*4)+(getCarps()*4)+(getFats()*9);
  }

  double getFats() {
    return fats * weight / 100;
  }

  double getCarps() {
    return carps * weight / 100;
  }
}
