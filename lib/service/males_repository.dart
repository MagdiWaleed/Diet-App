import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diet_app2/page/single_male_screen/single_male_model.dart';
import 'package:get/get.dart';

class MalesRepository extends GetxController {
  final _db = FirebaseFirestore.instance;


 Future<List> getAllSingleMeals()async
 {
   final snapshot = await _db.collection("single_male").get();

      final malesData =
          snapshot.docs.map((e) => SingleMaleModel.fromSnapshot(e)).toList();
      return malesData;
 }
}
