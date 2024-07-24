import 'package:diet_app2/page/sign_in/sign_in_controller.dart';
import 'package:diet_app2/theme/app_colors.dart';
import 'package:diet_app2/widget/custom_text.dart';
import 'package:diet_app2/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final SignInController _controller = Get.put(SignInController());
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
        child: GetBuilder<SignInController>(
            init: _controller,
            builder: (c) {
              return PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: _controller.pageController,
                children: [
                  Column(
                    children: [
                      SizedBox(height: 100),
                      CustomTextField(
                        controller: _controller.controllers[0],
                        title: "اليوزرنيم",
                      ),
                      SizedBox(height: 10),
                      CustomTextField(
                        controller: _controller.controllers[1],
                        title: "الباسورد",
                        ispassword: true,
                      ),
                      SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          _controller.createAccount();
                        },
                        child: CustomText(
                          title: "انشاء حساب",
                          fw: FontWeight.bold,
                          color: AppColors.buttonColor,
                        ),
                        style: ButtonStyle(),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: CustomText(title: "تسجيل الخروج"),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(AppColors.loading),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              child: CustomText(title: "تسجيل الدخول"),
                              style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    AppColors.buttonColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                    ],
                  ),
                  Center(
                    child: Column(
                      children: [
                        SizedBox(height: 100),
                        CustomTextField(
                          controller: _controller.controllers[2],
                          title: "الاسم",
                        ),
                        SizedBox(height: 10),
                        CustomTextField(
                          controller: _controller.controllers[0],
                          title: "اليوزرنيم",
                        ),
                        SizedBox(height: 10),
                        CustomTextField(
                          controller: _controller.controllers[1],
                          title: "الباسورد",
                          ispassword: true,
                        ),
                        SizedBox(height: 20),
                        TextButton(
                          onPressed: () {
                            _controller.ihaveAccound();
                          },
                          child: CustomText(
                            title: "لدي حساب",
                            fw: FontWeight.bold,
                            color: AppColors.buttonColor,
                          ),
                          style: ButtonStyle(),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  _controller.ihaveAccound();
                                },
                                child: CustomText(title: "العودة"),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      AppColors.loading),
                                ),
                              ),
                            ),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  _controller.anotherDetails();
                                },
                                child: CustomText(title: "التالي"),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.grey),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 50),
                      ],
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        SizedBox(height: 100),
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                controller: _controller.controllers[3],
                                title: "العمر",
                                textInputType: TextInputType.number,
                              ),
                            ),
                            SizedBox(width: 5),
                            Expanded(
                              child: CustomTextField(
                                controller: _controller.controllers[4],
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
                                controller: _controller.controllers[5],
                                textInputType: TextInputType.number,
                                title: "الوزن",
                              ),
                            ),
                            SizedBox(width: 5),
                            Expanded(
                              child: CustomTextField(
                                controller: _controller.controllers[6],
                                textInputType: TextInputType.number,
                                title: "النشاط اليومي",
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Card(
                                color: AppColors.buttonColor,
                                child: RadioListTile(
                                  value: !_controller.isBulking,
                                  title: CustomText(title: "تنشيف"),
                                  groupValue: true,
                                  onChanged: (_) {
                                    _controller.switchGoals();
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: Card(
                                color: AppColors.buttonColor,
                                child: RadioListTile(
                                  title: CustomText(title: "تضخيم"),
                                  value: _controller.isBulking,
                                  groupValue: true,
                                  onChanged: (_) {
                                    _controller.switchGoals();
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        CustomText(
                          title: "نووته: بكون بين 1.2 و 1.9",
                          color: Colors.black,
                        ),
                        CustomText(
                          title: "نووته: الافرج هو 1.55",
                          color: Colors.black,
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  _controller.ihaveAccound();
                                },
                                child: CustomText(title: "العودة"),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      AppColors.loading),
                                ),
                              ),
                            ),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  _controller.onCreateAccountSave(context);
                                  // _controller.createNewUserRepository();
                                },
                                child: CustomText(title: "التالي"),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      AppColors.buttonColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 50),
                      ],
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
