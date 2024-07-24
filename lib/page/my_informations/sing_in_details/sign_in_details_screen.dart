import 'package:diet_app2/model/user_model.dart';
import 'package:diet_app2/page/my_informations/sing_in_details/sign_in_controller.dart';
import 'package:diet_app2/theme/app_colors.dart';
import 'package:diet_app2/widget/custom_text.dart';
import 'package:diet_app2/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInDetailsScreen extends StatelessWidget {
  SignInDetailsScreen({super.key, required this.me});
  final UserModel me;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<SignInDetailsController>(
            init: SignInDetailsController(me: me),
            builder: (_controller) {
              return Column(
                children: [
                  SizedBox(height: 100),
                  CustomTextField(
                    controller: _controller.controllers[0],
                    title: "الاسم",
                  ),
                  SizedBox(height: 10),
                  CustomTextField(
                    controller: _controller.controllers[1],
                    title: "اليوزرنيم",
                  ),
                  SizedBox(height: 10),
                  CustomTextField(
                    controller: _controller.controllers[2],
                    title: "الباسورد",
                    ispassword: true,
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            _controller.onSave(context);
                          },
                          child: CustomText(title: "حفظ"),
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                AppColors.buttonColor),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: CustomText(title: "الغاء"),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(AppColors.loading),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 50),
                ],
              );
            }),
      ),
    );
  }
}
