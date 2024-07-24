import 'package:diet_app2/page/my_informations/create_meals/create_single_meal_details/add_component/add_component_controller.dart';
import 'package:diet_app2/page/single_male_screen/single_male_model.dart';
import 'package:diet_app2/page/single_male_screen/single_male_screen.dart';
import 'package:diet_app2/theme/app_colors.dart';
import 'package:diet_app2/widget/custom_meal_card.dart';
import 'package:diet_app2/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';

class AddComponentScreen extends StatelessWidget {
  AddComponentScreen({super.key, this.comingFromCompleteMealScreen,});

  bool? comingFromCompleteMealScreen;
  
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
          title: "اختار المكونات",
        ),
        centerTitle: true,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 100),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GetBuilder<AddComponentController>(
                  init: AddComponentController(
                      comingFromCompleteMealScreen:
                          comingFromCompleteMealScreen,),
                  builder: (controller) {
                    return FutureBuilder(
                      future: controller.getData(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasData) {
                            List<SingleMaleModel> data =
                                snapshot.data as List<SingleMaleModel>;
                            return Column(
                              children: [
                                for (int i = 0; i < data.length; i++)
                                  Stack(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          controller.selectComponent(data[i]);
                                        },
                                        onLongPress: () {
                                          Get.to(SingleMaleScreen(
                                              singleMaleModel: data[i]));
                                        },
                                        child: CustomMealCard(
                                          name: data[i].name,
                                          calories: data[i].getCalories(),
                                        ),
                                      ),
                                    ],
                                  )
                              ],
                            );
                          } else {
                            return Container(
                              alignment: Alignment.center,
                              width: double.infinity,
                              color: Colors.black,
                              height: 300,
                              child: CustomText(
                                title: "there are no data ",
                              ),
                            );
                          }
                        } else {
                          return Center(
                            child: Container(
                              height: 80,
                              width: 80,
                              child: LoadingIndicator(
                                  indicatorType: Indicator.lineScale,
                                  colors: [AppColors.buttonColor],
                                  strokeWidth: 2,
                                  backgroundColor: Colors.transparent,
                                  pathBackgroundColor: Colors.transparent),
                            ),
                          );
                        }
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
