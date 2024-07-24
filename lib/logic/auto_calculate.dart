import 'dart:convert';
import 'dart:math';
import 'package:diet_app2/appData.dart';
import 'package:get/get.dart';
import "package:shared_preferences/shared_preferences.dart";
import 'package:diet_app2/page/single_male_screen/single_male_model.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class AutoCalculate {
  List<SingleMaleModel> meals;
  AutoCalculate({required this.meals});
  List<double> simpleSimplestMethod(double limit) {
    List<double> weight = [];
    Random random = Random();
    for (int i = 0; i < meals.length; i++) {
      final double number = random.nextDouble()*limit + 50;
      weight.add(double.parse(number.toString()));
    };
    print(weight);
    return weight;
  }


  int closestIndex(List<num> list, num target) {

  int closestIdx = 0;
  num closestDiff = (list[0] - target).abs();

  for (int i = 1; i < list.length; i++) {
    num currentDiff = (list[i] - target).abs();
    if (currentDiff < closestDiff) {
      closestIdx = i;
      closestDiff = currentDiff;
    }
  }

  return closestIdx;
}
  
  void swap_single_index(List list ,int index1,int index2){
    var temp = list[index1];
    list[index1] = list[index2];
    list[index2] = temp;
  }


  List<List<double>> swap_indexes( List<double> features ){
    List<List<double>> data = [features];
      for (int i=0; i<3;i++){
        for (int j=0; j<3;j++){
          late List<double> helper;
          if (j==2 && j != i){
             helper = [...features];
            swap_single_index(helper, i, j*3);
            swap_single_index(helper, i+1, (j*3)+1);
            swap_single_index(helper, i+2, (j*3)+1);
            data.add(helper);
            helper = [...features];
          }else if(i >=j){
            continue;
          }
          else{
             helper = [...features];
            swap_single_index(helper, i, j*3);
            swap_single_index(helper, i+1, (j*3)+1);
            swap_single_index(helper, i+2, (j+3)+1);
          }
          data.add(helper);
      }
  }
  return data;
  }

  Future<List<double>> weight_for__3Component(double custom_calories)async{
   List<double> weights = [];
   List<double> total_calories = [];
   final user = appData.getUserModel();
       final interpreter = await Interpreter.fromAsset('asset/model/converted_model (1).tflite');
       List<double> features = [];
  print(meals);
    meals.sort((a, b) => a.name.compareTo(b.name));
  print(meals);
       for (var meal in meals){
        features.add(meal.protein);
        features.add(meal.carps);
        features.add(meal.fats);
       }
       if(custom_calories ==0)
       features.add(user.caloriesGoal!);
       else
       features.add(custom_calories);

      //  print(custom_calories);

       List<List<double>> generated_data = swap_indexes(features);
       
      //  var x = [features];
       var generated_weights = List.filled(6*3,0).reshape([6,3]);       
       interpreter.run(generated_data, generated_weights);
      //  print(generated_weights);
       for (int i = 0; i <generated_weights.length; i++){
        final temp = [...meals];
        double calories = 0.0;
        temp[0].setWeight(generated_weights[i][0]);
        temp[1].setWeight(generated_weights[i][1]);
        temp[2].setWeight(generated_weights[i][2]);
        calories += meals[0].getCalories()+meals[1].getCalories()+meals[2].getCalories();
        total_calories.add(calories);
       }
      //  print(total_calories);
      //  weights = generated_weights[0];
       final int closest_index =closestIndex(total_calories, user.caloriesGoal!);
      // print(generated_weights[closest_index]);
   return generated_weights[closest_index];
  }
}
