import 'package:diet_app2/page/single_male_screen/single_male_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleMaleController extends GetxController {
  double weight = 100;
  final SingleMaleModel male;
  double? protien, carp, fat, calories;
  Map<String, num>? Vit, fi;
  List<String>? allVi, allFi;
  TextEditingController controller = TextEditingController();
  SingleMaleController({required this.male}) {
    protien = male.protein;
    carp = male.carps;
    fat = male.fats;
    calories = male.calories;
    Vit = male.Vitamins;
    allVi = Vit == null ? [] : Vit!.keys.toList();
    fi = male.Fiber_M;
    allFi = fi == null ? [] : fi!.keys.toList();
  }
  @override
  void onInit() {
    controller.text = male.weight.round().toString();
    super.onInit();
  }

  void setNewWeight(double w) {
    protien = w * male.protein / 100;
    carp = w * male.carps / 100;
    fat = w * male.fats / 100;
    calories = w * male.calories! / 100;
    if (Vit != null) {
      for (String i in Vit!.keys) {
        Vit![i] = w * male.Vitamins![i]! / 100;
      }
    }
    if (fi != null) {
      for (String i in fi!.keys) {
        fi![i] = w * male.Fiber_M![i]! / 100;
      }
    }

    weight = w;
    update();
  }
}
