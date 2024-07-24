import 'dart:convert';

import 'package:diet_app2/appData.dart';
import 'package:diet_app2/model/complete_male_model.dart';
import 'package:diet_app2/model/user_model.dart';
import 'package:diet_app2/page/main_screen/main_screen.dart';
import 'package:diet_app2/page/sign_in/sign_in_screen.dart';
import 'package:diet_app2/service/main_repository.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadingController extends GetxController {
  late UserModel me;
  @override
  void onInit() async {
    final SP = await SharedPreferences.getInstance();
    if (jsonDecode(SP.getString("user").toString()) != null) {
      Map user = jsonDecode(SP.getString("user").toString());
      List<CompleteMaleModel> myDiet;
      if (SP.getStringList("myDiet") != null) {
        myDiet = SP
            .getStringList("myDiet")!
            .map((e) => CompleteMaleModel.fromJson(e))
            .toList();
      } else {
        myDiet = [];
      }
      me = UserModel(
          name: user["name"],
          userName: user["userName"],
          password: user["password"],
          id: user["id"],
          tall: double.parse(user["tall"].toString()),
          weight: double.parse(user["weight"].toString()),
          dailyActive: double.parse(user["dailyActive"].toString()),
          goal: user["goal"],
          age: double.parse(user["age"]),
          myDietMales: myDiet);
      appData.setUserModel(me);
      final data = Get.put(MainRepository());
      final gif = await data.getMainScreenGif();
      String link = gif.link;
      appData.setMainGif(link);
      Get.off(MainScreen(me: me));
    } else {
      final data = Get.put(MainRepository());
      final gif = await data.getMainScreenGif();
      String link = gif.link;
      appData.setMainGif(link);
      Get.off(SignInScreen());
    }
    super.onInit();
  }
}
