// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diet_app2/appData.dart';
import 'package:diet_app2/page/my_informations/create_meals/create_meals_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:diet_app2/model/complete_male_model.dart';

class CreateMealsRepository extends GetxController {
  final _db = FirebaseFirestore.instance;

  Future<List> getMeals() async {
    final snapshot = await _db.collection("complete_meals").get();
    final data =
        snapshot.docs.map((e) => CreateMealsModel.fromSnapshot(e)).toList();
    return data;
  }

  Future<List> getMyMeals() async {
    final snapshot = await _db
        .collection("complete_meals")
        .where("createdByid", isEqualTo: appData.getUserModel().id)
        .get();
    final data =
        snapshot.docs.map((e) => CreateMealsModel.fromSnapshot(e)).toList();
    return data;
  }

  Future updateMeal(CreateMealsModel data) async {
    try {
      await _db.collection("complete_meals").doc(data.id).update(data.toMap());
      print(data.id);
    } catch (e) {
      print(e.toString());
    }
  }

  Future getSingleMeal(String mealId) async {
    final snapshot = await _db.collection("complete_meals").doc(mealId).get();
    final data = CreateMealsModel.fromSnapshot(snapshot);
    return data;
  }

  void addMeal(CreateMealsModel createMealsModel) async {
    await _db.collection("complete_meals").add(createMealsModel.toMap());
  }
}
