import 'dart:convert';

import 'package:diet_app2/appData.dart';
import 'package:diet_app2/model/user_model.dart';
import 'package:diet_app2/page/main_screen/main_screen.dart';
import 'package:diet_app2/service/user_auth_repository.dart';
import 'package:diet_app2/theme/app_colors.dart';
import 'package:diet_app2/widget/custom_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInController extends GetxController {
  bool isBulking = true;
  final _data = Get.put(UserAuthRepository());
  List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  PageController pageController = PageController();

  void onCreateAccountSave(BuildContext context) async {
    if (controllers[0].value.text != "" && controllers[1].value.text != "") {
      final sp = await SharedPreferences.getInstance();

      UserModel me = UserModel(
          userName: controllers[0].text,
          password: controllers[1].text,
          name: controllers[2].text,
          age: double.parse(controllers[3].text),
          tall: double.parse(controllers[4].text),
          weight: double.parse(controllers[5].text),
          dailyActive: double.parse(controllers[6].text),
          goal: isBulking ? "bulk" : "cut",
          id: "new account",
          myDietMales: []);
      sp.setString("user", me.ConvertToJson());
      appData.setUserModel(me);
      Get.off(MainScreen(me: me));
      QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        title: "",
        widget: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              title: "تم انشاء الحساب بنجاح",
              size: 16,
              color: Colors.black,
            ),
          ],
        ),
        showConfirmBtn: false,
      );
    } else {
      QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          title: "",
          widget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                title: "الرجاء ملء جميع الخانات",
                size: 16,
                color: Colors.black,
              ),
            ],
          ),
          confirmBtnText: "اعادة المحاولة",
          confirmBtnColor: AppColors.loading);
    }
  }

  void createAccount() {
    pageController.nextPage(
        duration: Duration(milliseconds: 8), curve: Curves.bounceIn);
    update();
  }

  void ihaveAccound() {
    pageController.previousPage(
        duration: Duration(milliseconds: 10), curve: Curves.bounceIn);
    update();
  }

  void anotherDetails() {
    pageController.nextPage(
        duration: Duration(milliseconds: 8), curve: Curves.bounceIn);
    update();
  }

  Future createNewUserRepository() async {
  
    try {
      final user = await _data.createUserWithEmailAndPassword(
          controllers[0].text, controllers[1].text);
    } catch (e) {
      print(e.toString());
    }
  }

  void switchGoals() {
    isBulking = !isBulking;
    update();
  }
}
