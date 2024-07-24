import 'package:diet_app2/model/complete_male_model.dart';

class CurrentDietModel {
  final List<CompleteMaleModel> males;
  num calories = 0, protein = 0, carps = 0, fats = 0;
  CurrentDietModel({required this.males}) {
    for (int i = 0; i < males.length; i++) {
      calories += num.parse(males[i].calories.toString());
      protein += males[i].protein;
      carps += males[i].carps;
      fats += males[i].fats;
    }
  }
}


