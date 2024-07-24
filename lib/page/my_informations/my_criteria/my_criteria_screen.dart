import 'package:diet_app2/appData.dart';
import 'package:diet_app2/model/user_model.dart';
import 'package:diet_app2/page/my_informations/my_criteria/my_criteria_controller.dart';
import 'package:diet_app2/theme/app_colors.dart';
import 'package:diet_app2/widget/custom_text.dart';
import 'package:diet_app2/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCriteriaScreen extends StatelessWidget {
  const MyCriteriaScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: AppColors.buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        title: CustomText(
          title: "معلومات تسجيل الدخول",
        ),
        centerTitle: true,
      ),
      body: GetBuilder<MyCriteriaController>(
        init: MyCriteriaController(),
        builder: (_controller) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 100),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          controller: _controller.controllers[0],
                          title: "العمر",
                          textInputType: TextInputType.number,
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: CustomTextField(
                          controller: _controller.controllers[1],
                          textInputType: TextInputType.number,
                          title: "الطول",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          controller: _controller.controllers[2],
                          textInputType: TextInputType.number,
                          title: "الوزن",
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: CustomTextField(
                          controller: _controller.controllers[3],
                          textInputType: TextInputType.number,
                          title: "النشاط اليومي",
                        ),
                      ),
                    ],
                  ),
                  GetBuilder<MyCriteriaController>(
                      init: _controller,
                      id: "update this", //todo i dont know if this good but i did it anyway
                      builder: (_c) {
                        return Row(
                          children: [
                            Expanded(
                              child: Card(
                                color: AppColors.buttonColor,
                                child: RadioListTile(
                                  value: !_controller.theGoalIsBulking,
                                  title: CustomText(title: "تنشيف"),
                                  groupValue: true,
                                  onChanged: (_) {
                                    _c.switchGoals();
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: Card(
                                color: AppColors.buttonColor,
                                child: RadioListTile(
                                  title: CustomText(title: "تضخيم"),
                                  value: _controller.theGoalIsBulking,
                                  groupValue: true,
                                  onChanged: (_) {
                                    _c.switchGoals();
                                  },
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColors.buttonColor,
                        borderRadius: BorderRadius.circular(8)),
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                    ),
                    child: Column(
                      children: [
                        CustomText(title: "الاحتياج اليومي"),
                        CustomText(
                            title: appData
                                .getUserModel()
                                .caloriesNeeds
                                .toString()),
                        CustomText(title: "الهدف"),
                        CustomText(
                            title:
                                appData.getUserModel().caloriesGoal.toString()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomSheet: GetBuilder<MyCriteriaController>(
        init: MyCriteriaController(),
        builder: (_controller) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: CustomText(title: "العودة"),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(AppColors.loading),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        _controller.onChangeDataSave(context);
                      },
                      child: CustomText(title: "التالي"),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(AppColors.buttonColor),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
            ],
          );
        },
      ),
    );
  }
}
