import 'package:diet_app2/page/single_male_screen/single_male_controller.dart';
import 'package:diet_app2/page/single_male_screen/single_male_model.dart';
import 'package:diet_app2/theme/app_colors.dart';
import 'package:diet_app2/widget/custom_background.dart';
import 'package:diet_app2/widget/custom_text.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleMaleScreen extends StatelessWidget {
  SingleMaleScreen({super.key, required this.singleMaleModel});
  final SingleMaleModel singleMaleModel;
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15))),
        backgroundColor: AppColors.buttonColor,
        centerTitle: true,
        title: CustomText(title: singleMaleModel.name),
      ),
      body: Stack(
        children: [
          Container(
            height: double.maxFinite,
            child: Image.network(
              faker.image.image(),
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 100),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        title: singleMaleModel.name,
                        fw: FontWeight.bold,
                        size: 15,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.buttonColor,
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    child: GetBuilder<SingleMaleController>(
                        init: SingleMaleController(male: singleMaleModel),
                        builder: (controller) {
                          return TextField(
                            controller: controller.controller,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Cairo",
                                fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: AppColors.buttonColor, width: 0.5),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    BorderSide(color: Colors.white, width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13),
                                borderSide: BorderSide(
                                    color: AppColors.buttonColor, width: 0.5),
                              ),
                              label: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(width: 10),
                                  CustomText(title: "الكمية"),
                                  SizedBox(width: 2),
                                ],
                              ),
                            ),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            onChanged: (t) {
                              if (t != "")
                                Get.find<SingleMaleController>()
                                    .setNewWeight(double.parse(t));
                            },
                          );
                        }),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: AppColors.buttonColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: GetBuilder<SingleMaleController>(
                        init: SingleMaleController(male: singleMaleModel),
                        builder: (c) {
                          return Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    child: CustomText(title: "الكالوريز:  "),
                                  ),
                                  Container(
                                    child: CustomText(
                                        title: c.calories!
                                            .toPrecision(2)
                                            .toString()),
                                  ),
                                  Icon(
                                    Icons.local_fire_department_outlined,
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Divider(
                                thickness: 1,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    child: CustomText(title: "بروتين:  "),
                                  ),
                                  Container(
                                    child: CustomText(
                                        title: c.protien!
                                            .toPrecision(2)
                                            .toString()),
                                  ),
                                  Icon(
                                    Icons.local_fire_department_outlined,
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Divider(
                                thickness: 1,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    child:
                                        CustomText(title: "الكاربوهيدرات:  "),
                                  ),
                                  Container(
                                    child: CustomText(
                                        title:
                                            c.carp!.toPrecision(2).toString()),
                                  ),
                                  Icon(
                                    Icons.local_fire_department_outlined,
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Divider(
                                thickness: 1,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    child: CustomText(title: "الدهون:  "),
                                  ),
                                  Container(
                                    child: CustomText(
                                        title:
                                            c.fat!.toPrecision(2).toString()),
                                  ),
                                  Icon(
                                    Icons.local_fire_department_outlined,
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Divider(
                                thickness: 1,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          );
                        }),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: AppColors.buttonColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomText(title: "ملاحظات:"),
                        CustomText(
                            title: singleMaleModel.notes == " "
                                ? "بالهنا و الشفا"
                                : singleMaleModel.notes!)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GetBuilder<SingleMaleController>(
                      init: SingleMaleController(male: singleMaleModel),
                      builder: (c) {
                        return c.allVi!.length == 0
                            ? Container()
                            : Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 20,
                                      ),
                                      CustomText(
                                        title: " المعادن و الالياف",
                                        size: 16,
                                      )
                                    ],
                                  ),
                                  for (int i = 0; i < c.allFi!.length; i++)
                                    _CustomCardView(
                                      title: c.allFi![i],
                                      value: num.parse(
                                          c.fi![c.allFi![i]].toString()),
                                    ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 20,
                                      ),
                                      CustomText(
                                        title: "الفيتمينات",
                                        size: 16,
                                      )
                                    ],
                                  ),
                                  for (int i = 0; i < c.allVi!.length; i++)
                                    _CustomCardView(
                                      title: c.allVi![i],
                                      value: num.parse(
                                          c.Vit![c.allVi![i]].toString()),
                                    ),
                                ],
                              );
                      }),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomCardView extends StatelessWidget {
  _CustomCardView({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final num value;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(color: Colors.transparent.withOpacity(0.6)),
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Container(
            width: 1,
            height: 20,
            color: AppColors.buttonColor,
          ),
          SizedBox(width: 20),
          CustomText(title: title + ": "),
          SizedBox(width: 10),
          CustomText(title: value.toString()),
          Spacer(),
          Container(
            width: 1,
            color: AppColors.buttonColor,
            height: 20,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}
