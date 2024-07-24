import 'dart:convert';

import 'package:diet_app2/page/sign_in/sign_in_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyInformationController extends GetxController {
  void deleteTheAccount() async {
    final sp = await SharedPreferences.getInstance();
    sp.remove("user");
    Get.offAll(SignInScreen());
  }
}
