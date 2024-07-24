import 'package:diet_app2/appData.dart';
import 'package:diet_app2/page/my_informations/create_meals/create_single_meal_details/create_single_meal_details_controller.dart';
import 'package:diet_app2/page/my_informations/my_males_current_diet/complete_male/complete_male_controller.dart';
import 'package:diet_app2/page/single_male_screen/single_male_model.dart';
import 'package:diet_app2/service/males_repository.dart';
import 'package:get/get.dart';

class AddComponentController extends GetxController {
  final data = Get.put(MalesRepository());
  bool? comingFromCompleteMealScreen;
  
  AddComponentController({this.comingFromCompleteMealScreen});
  void selectComponent(SingleMaleModel component) {
    comingFromCompleteMealScreen = comingFromCompleteMealScreen ?? false;
    if (comingFromCompleteMealScreen!) {
      Get.find<CompleteMaleController>().components.add(component);
      Get.find<CompleteMaleController>().calculatDetails();
      Get.find<CompleteMaleController>().update();
      Get.back();
    } else {
      Get.find<CreateSingleMealDetailsController>().components.add(component);
      Get.find<CreateSingleMealDetailsController>().calculatDetails();
      Get.find<CreateSingleMealDetailsController>().update();
      Get.back();
    }
  }

  Future<List> getData() async {
    try {
      return data.getAllSingleMeals();
    } catch (e) {
      print(e);
      return [];
    }
  }
}
