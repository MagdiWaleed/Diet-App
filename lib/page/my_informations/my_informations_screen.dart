import 'package:diet_app2/appData.dart';
import 'package:diet_app2/model/user_model.dart';
import 'package:diet_app2/page/main_screen/main_screen.dart';
import 'package:diet_app2/page/my_informations/create_meals/create_meals_screen.dart';
import 'package:diet_app2/page/my_informations/my_criteria/my_criteria_screen.dart';
import 'package:diet_app2/page/my_informations/my_informations_controller.dart';
import 'package:diet_app2/page/my_informations/my_males_current_diet/my_males_current_diet_screen.dart';
import 'package:diet_app2/page/my_informations/sing_in_details/sign_in_details_screen.dart';
import 'package:diet_app2/page/setting/setting_screen.dart';
import 'package:diet_app2/theme/app_colors.dart';
import 'package:diet_app2/widget/custom_background.dart';
import 'package:diet_app2/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyInformationScreen extends StatelessWidget {
  MyInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15))),
        backgroundColor: AppColors.buttonColor.withOpacity(1),
        centerTitle: true,
        title: CustomText(title: "معلواتي"),
      ),
      body: CustomBackground(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 120),
            GetBuilder<MyInformationController>(
                id: "name",
                init: MyInformationController(),
                builder: (_) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    padding: EdgeInsets.symmetric(vertical: 20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.buttonColor,
                    ),
                    child: CustomText(
                      title: "اهلا ${appData.getUserModel().name}",
                      size: 20,
                    ),
                  );
                }),
            SizedBox(height: 30),
            _CustomElvatedButton(
                title: "معلومات تسجيل الدخول ",
                onTap: () {
                  Get.to(SignInDetailsScreen(me: appData.getUserModel()));
                }),
            SizedBox(height: 20),
            _CustomElvatedButton(
              title: "معلوماتي لتصميم نظامي الغذائي",
              onTap: () {
                Get.to(MyCriteriaScreen());
              },
            ),
            SizedBox(height: 20),
            _CustomElvatedButton(
                title: "وجباتي في الدايت الحالي",
                onTap: () {
                  Get.to(MyMalesCurrentDietScreen());
                }),
            SizedBox(height: 20),
            _CustomElvatedButton(
                title: "تصميماتي (وجباتي)",
                onTap: () {
                  Get.to(CreateMealsScreen());
                }),
            SizedBox(height: 20),
            _CustomElvatedButton(
                title: "الاعدادات",
                onTap: () {
                  Get.to(SettingScreen());
                }),
            SizedBox(height: 20),
            GetBuilder<MyInformationController>(
                init: MyInformationController(),
                builder: (_controller) {
                  return _CustomElvatedButton(
                    title: "حذف الحساب",
                    onTap: () {
                      _controller.deleteTheAccount();
                    },
                    isdeleteButton: true,
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class _CustomElvatedButton extends StatelessWidget {
  _CustomElvatedButton({
    super.key,
    this.isdeleteButton,
    required this.title,
    required this.onTap,
  });
  bool? isdeleteButton;

  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: onTap,
        child: CustomText(title: title),
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
              isdeleteButton ?? false
                  ? AppColors.loading
                  : AppColors.buttonColor,
            ),
            shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
            padding: MaterialStatePropertyAll(EdgeInsets.all(15))),
      ),
    );
  }
}
