import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diet_app2/appData.dart';
import 'package:diet_app2/model/complete_male_model.dart';
import 'package:diet_app2/page/my_informations/my_males_current_diet/my_males_current_diet_controller.dart';
import 'package:diet_app2/page/single_male_screen/single_male_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DietDetialsController extends GetxController{
  // final  MyMalesCurrentDietController currentDietController;
  //  DietDetialsController({required this.currentDietController});
final List<TextEditingController> priceControllers= [];
final List<TextEditingController> portionControllers= [];
List<String>compoenent_names=[];
List<double> component_weights=[];
Map<String,double> component_details = {};
@override
  void onInit() {
    
    for (CompleteMaleModel completeMeal in appData.getUserModel().myDietMales)
        for (SingleMaleModel singleMaleModel in completeMeal.components){
              if (compoenent_names.contains(singleMaleModel.name)){
                  final int index =compoenent_names.indexOf(singleMaleModel.name);
                  component_weights[index]+= singleMaleModel.weight;
                  }
              else{
               compoenent_names.add(singleMaleModel.name);
              component_weights.add(singleMaleModel.weight);
              priceControllers.add(TextEditingController());
              portionControllers.add(TextEditingController());
              }
          }
    for(int i = 0 ; i <compoenent_names.length;i++){
        priceControllers[i].text = "30.0";
        portionControllers[i].text = "1";
    
      component_details[compoenent_names[i]]= component_weights[i];
    }
    update();
    
    super.onInit();
  }

PriceName getComponentDetails(int i){
    final double price = double.parse(priceControllers[i].text).toPrecision(2);
    final PriceName component = PriceName(name:
     compoenent_names[i],price:
      double.parse(priceControllers[i].text).toPrecision(2),
    weight: component_weights[i].toPrecision(2));

    return component;

    }

}





class PriceName{
  final double price;
  final String name;
  final double weight;
  PriceName({required this.price, required this.name, required this.weight});
  
  double getPriceForDay(){
    return (price*(weight/1000)).toPrecision(2);
  } 
  double getPriceForWeek(){
    return (price*(weight/1000)*7).toPrecision(2);
  }
  double getPriceForMonth(){
    return (price*(weight/1000)*30).toPrecision(2);
  }
}