import 'package:diet_app2/appData.dart';

class Statistics{
  late String username;
  final List<double> weights;
  final List<String> names;
  final double calories;
  Statistics({required this.weights,required this.names, required this.calories});

 Map<String,dynamic> toMap(){
    final user = appData.getUserModel();
    return {
      "username":user.name,
      "weights": weights,
      "names": names,
      "calories": calories,
    };
}

}