import 'package:diet_app2/appData.dart';
import 'package:diet_app2/service/create_meals_repository.dart';
import 'package:get/get.dart';

class CreateMealsController extends GetxController {
  final data = Get.put(CreateMealsRepository());
  List<num> calories = [], protein = [], fat = [], carp = [];

  Future<List> getMyCreatedMeals() async {
    try {
      return data.getMyMeals();
    } catch (e) {
      return [];
    }
  }
}
