import 'dart:convert';

import 'package:diet_app2/model/complete_male_model.dart';
import 'package:diet_app2/page/single_male_screen/single_male_model.dart';

class UserModel {
  String name;
  String userName;
  String password;
  final String id;
  double tall;
  double weight;
  double age;

  double dailyActive;
  String goal;
  double? caloriesNeeds;
  double? caloriesGoal;
  List<CompleteMaleModel>? myCreatedMales = [];
  List<CompleteMaleModel> myDietMales = [];
  List<CompleteMaleModel>? myFavoriteMales = [];
  List<SingleMaleModel>? myFavoriteComponent = [];
  UserModel({
    required this.name,
    required this.userName,
    required this.password,
    required this.id,
    required this.tall,
    required this.weight,
    required this.age,
    required this.goal,
    required this.dailyActive,
    //todo handel the rest of the variables in the coming converter to json file
    this.caloriesNeeds,
    this.caloriesGoal,
    this.myCreatedMales,
    required this.myDietMales,
    this.myFavoriteMales,
    this.myFavoriteComponent,
  }) {
    calculateCalories();
  }
  String ConvertToJson() {
    Map<String, String> userEncode = {
      "name": name,
      "userName": userName,
      "password": password,
      "id": id,
      "tall": tall.toString(),
      "weight": weight.toString(),
      "age": age.toString(),
      "dailyActive": dailyActive.toString(),
      "goal": goal,
    };
    return jsonEncode(userEncode);
  }

  void calculateCalories() {
    caloriesNeeds = dailyActive;
    caloriesGoal =
        goal == "bulk" ? (caloriesNeeds! + 500) : (caloriesNeeds! - 500);
  }

  double getProtein() {
    return weight * 1.8;
  }

  double getCarp() {
    final cal = caloriesGoal! - (getProtein() * 4 + getFat() * 9);
    return cal / 4;
  }

  double getFat() {
    return (caloriesGoal! * 30 / 100) / 9;
  }
}
