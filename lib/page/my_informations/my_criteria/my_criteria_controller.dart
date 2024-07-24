import 'dart:convert';

import 'package:diet_app2/appData.dart';
import 'package:diet_app2/model/user_model.dart';
import 'package:diet_app2/theme/app_colors.dart';
import 'package:diet_app2/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyCriteriaController extends GetxController {
  List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  late bool theGoalIsBulking;
  @override
  void onInit() {
    controllers[0].text = appData.getUserModel().age.toString();
    controllers[1].text = appData.getUserModel().tall.toString();
    controllers[2].text = appData.getUserModel().weight.toString();
    controllers[3].text = appData.getUserModel().dailyActive.toString();
    theGoalIsBulking = appData.getUserModel().goal == "bulk" ? true : false;
    super.onInit();
  }

  void switchGoals() {
    theGoalIsBulking = !theGoalIsBulking;
    update(["update this"]);
  }

  void onChangeDataSave(BuildContext context) async {
    if (controllers[0].value.text != "" &&
        controllers[1].value.text != "" &&
        controllers[2].value.text != "" &&
        controllers[3].value.text != "") {
      final sp = await SharedPreferences.getInstance();
      final me = appData.getUserModel();
      me.age = double.parse(controllers[0].text);
      me.tall = double.parse(controllers[1].text);
      me.weight = double.parse(controllers[2].text);
      me.dailyActive = double.parse(controllers[3].text);
      me.goal = theGoalIsBulking ? "bulk" : "cut";
      me.calculateCalories();
      appData.setUserModel(me);

      sp.setString("user", me.ConvertToJson());
      Get.back();
      QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        title: "",
        widget: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              title: "تم تعديل البيانات بنجاح",
              size: 16,
              color: Colors.black,
            ),
          ],
        ),
        showConfirmBtn: false,
      );
    } else {
      print("there is error");
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
}
