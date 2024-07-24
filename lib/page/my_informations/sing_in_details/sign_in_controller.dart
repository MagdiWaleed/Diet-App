import 'dart:convert';

import 'package:diet_app2/model/user_model.dart';
import 'package:diet_app2/page/my_informations/my_informations_controller.dart';
import 'package:diet_app2/theme/app_colors.dart';
import 'package:diet_app2/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quickalert/quickalert.dart';

class SignInDetailsController extends GetxController {
  final UserModel me;
  List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

  SignInDetailsController({required this.me});

  @override
  void onInit() {
    onLoad();

    super.onInit();
  }

  void onLoad() {
    controllers[0].text = me.name;
    controllers[1].text = me.userName;
    controllers[2].text = me.password;
  }

  void onSave(BuildContext context) async {
    if (controllers[0].value.text != "" &&
        controllers[1].value.text != "" &&
        controllers[2].value.text != "") {
      final sp = await SharedPreferences.getInstance();

      me.name = controllers[0].value.text;
      me.userName = controllers[1].value.text;
      me.password = controllers[2].value.text;

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
              title: "تم حفظ البيانات بنجاح",
              size: 16,
              color: Colors.black,
            ),
          ],
        ),
        showConfirmBtn: false,
      );
      Get.find<MyInformationController>().update(["name"]);
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
