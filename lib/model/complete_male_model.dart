import 'dart:convert';

import 'package:diet_app2/page/single_male_screen/single_male_model.dart';

class CompleteMaleModel {
  double calories = 0, protein = 0, carps = 0, fats = 0;
  double custom_calories= 0;
  bool isEaten;
  String? id;
  String? createdbyId;
  String name;
  List<SingleMaleModel> components;

  CompleteMaleModel(
      {this.id,
      required this.name,
      required this.components,
      required this.isEaten,
      }) {
    for (int i = 0; i < components.length; i++) {
      calories += double.parse(components[i].getCalories().toString());
      protein += components[i].getProtein();
      carps += components[i].getCarps();
      fats += components[i].getFats();
    }
  }
  void setNewWeight(int index, double w) {
    components[index].setWeight(w);
    calories = 0;
    protein = 0;
    carps = 0;
    fats = 0;

    for (int i = 0; i < components.length; i++) {
      calories += double.parse(components[i].getCalories().toString());
      protein += components[i].getProtein();
      carps += components[i].getCarps();
      fats += components[i].getFats();
    }
  }

  static String convertToJson(CompleteMaleModel completeMale) {
    Map<String, dynamic> meal = {
      "name": completeMale.name,
      "id": completeMale.id,
      "protein": completeMale.protein,
      "carps": completeMale.carps,
      "calories": completeMale.calories,
      "fats": completeMale.fats,
      "components": {},
      "isEaten": completeMale.isEaten ? "true" : "false"
    };
    for (int i = 0; i < completeMale.components.length; i++) {
      meal["components"]["$i"] =
          SingleMaleModel.convertToJson(completeMale.components[i]);
    }
    print(jsonEncode(meal));
    return jsonEncode(meal);
  }

  factory CompleteMaleModel.fromJson(String completeMale) {
    Map<String, dynamic> meal = jsonDecode(completeMale);
    List<String> keysList = meal["components"].keys.toList();
    List<SingleMaleModel> singlemale = [];
    for (var i in keysList) {
      singlemale
          .add(SingleMaleModel.fromJson(meal["components"][i.toString()]));
    }
    return CompleteMaleModel(
        name: meal["name"],
        id: meal["id"],
        components: singlemale,
        isEaten: meal["isEaten"] == null
            ? false
            : meal["isEaten"] == "true"
                ? true
                : false);
  }
  void setCustomCalories(String c){
    if(c !="" )
    custom_calories= double.parse(c);
    else custom_calories=0;
  }
}
