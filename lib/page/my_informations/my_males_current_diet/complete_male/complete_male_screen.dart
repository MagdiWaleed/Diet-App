import 'package:diet_app2/model/complete_male_model.dart';
import 'package:diet_app2/model/user_model.dart';
import 'package:diet_app2/page/my_informations/create_meals/create_single_meal_details/add_component/add_component_screen.dart';
import 'package:diet_app2/page/my_informations/my_males_current_diet/complete_male/complete_male_controller.dart';
import 'package:diet_app2/page/my_informations/my_males_current_diet/my_males_current_diet_controller.dart';
import 'package:diet_app2/service/males_repository.dart';
import 'package:diet_app2/service/user_service.dart';
import 'package:diet_app2/theme/app_colors.dart';
import 'package:diet_app2/widget/custom_text.dart';
import 'package:diet_app2/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';

class CompleteMaleScreen extends StatelessWidget {
   CompleteMaleScreen({super.key, required this.maleIndex});
  final int maleIndex;
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
          title: "المكونات",
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.find<CompleteMaleController>()
                  .onDeleteCompleteMale(maleIndex);

              Get.back();
            },
            icon: Icon(
              Icons.delete,
              color: Colors.white,
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(AppColors.loading)),
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: GetBuilder<CompleteMaleController>(
          init: CompleteMaleController(maleIndex: maleIndex),
          builder: (controller) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 100),
                  ElevatedButton(onPressed: (){
                    controller.uploadThisMeal(context);
                  },style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.buttonColor,
                              padding: EdgeInsets.symmetric(vertical:18)
                            ),
                            child: CustomText(title: "مشاركة هذه الوجبة؟",
                            ),
                            ),
                  Padding(
                    
                    padding: EdgeInsets.all(5),
                    child: CustomTextField(
                      title: "اسم الوجبة",
                      controller: controller.controller,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Stack(
                          children: [
                            Container(
                              width: 200,
                              
                              child: CustomTextField( 
                                title: "عدد معين من الكالوريز؟",
                                controller: controller.caloriesController,
                              ),
                            ),
                            Positioned(child: ElevatedButton(onPressed: (){controller.getTheRestOfCalories();},style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.buttonColor,
                              padding: EdgeInsets.symmetric(vertical:18,horizontal: 30)
                            ),
                            child: CustomText(title: "باقي الكالوريز؟",
                            ),
                            ),
                            left: 0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  for (int i = 0; i < controller.components.length; i++)
                    Stack(
                      children: [
                        GestureDetector(
                          onLongPress: (){
                            QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: "",
        widget: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              title: "مهلا! هل انت متأكد؟",
              size: 16,
              color: Colors.black,
                    ),
                  ],
                ),
                  showConfirmBtn:true,
                  showCancelBtn: true,
                  onConfirmBtnTap: (){
                  controller.deleteSingleComponent(i);
                            Get.back();
                            }
                          );
                          },
                          onTap: () {
                            controller.editThisComponent(i);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                            margin: EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: AppColors.buttonColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            width: double.infinity,
                            child: Stack(
                              children: [
                                Row(
                                  children: [
                                     Expanded(child: Center(
                                      child:RotatedBox(quarterTurns: 1,
                                       child: CustomText(
                                        title: "مكون رقم #${i+1}",
                                        )),),)
                                  ,Expanded(
                                      flex: 4,
                                      child: Column(
                                        children: [
                                         
                                          CustomText(
                                            title: controller.components[i].name,
                                            size: 18,
                                          ),
                                          
                                        SizedBox(
                                          height: 10,),
                                          CustomText(
                                              title:
                                                  "كارب:  ${controller.components[i].getCarps().toPrecision(2)}"),
                                          CustomText(
                                              title:
                                                  "فات:  ${controller.components[i].getFats().toPrecision(2)}"),
                                          CustomText(
                                              title:
                                                  "بروتين:  ${controller.components[i].getProtein().toPrecision(2)}"),
                                          CustomText(
                                              title:
                                                  "كالوريز:  ${controller.components[i].getCalories().toPrecision(2)}")
                                        ],
                                      ),
                                    ),
                                    ],
                                  
                                ),
                                CustomPaint(
                                  painter: Painter(),
                                  child: Container(height: 120,width: double.infinity,),
                                ),
                                 CustomPaint(
                                  painter: DashedPath(),
                                  child: Container(height: 120,width: double.infinity,),
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 8,
                          top: 3,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(8),
                                  topLeft: Radius.circular(8),
                                ),
                                color: AppColors.loading),
                            child: CustomText(
                              title: controller.components[i].weight.toPrecision(2).toString(),
                              fw: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Expanded(
                            child: ElevatedButton(
                          onPressed: () {
                            Get.to(AddComponentScreen(
                              comingFromCompleteMealScreen: true,
                            ));
                          },
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  AppColors.buttonColor),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)))),
                        )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            controller.autoChangeWeight();
                          },
                          child: Row(
                            children: [Icon(Icons.star,color:Colors.white,size: 20,),
                              CustomText(title: "   اوتو ويت"),
                            ],
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                AppColors.buttonColor,
                              ),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8))),
                              padding:
                                  MaterialStatePropertyAll(EdgeInsets.all(15))),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  GetBuilder<CompleteMaleController>(
                      init: CompleteMaleController(maleIndex: maleIndex),
                      builder: (controller) {
                        return Container(
                          decoration: BoxDecoration(
                            color: AppColors.buttonColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          width: double.infinity,
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          margin: EdgeInsets.only(bottom: 5, right: 5, left: 5),
                          child: Column(
                            children: [
                              CustomText(
                                title: "التوتال",
                                size: 18,
                              ),
                              Divider(
                                height: 10,
                                thickness: 0.5,
                                color: Colors.white,
                              ),
                              CustomText(
                                  title:
                                      "كارب:  ${controller.carps.toPrecision(2)}"),
                              CustomText(
                                  title:
                                      "فات:  ${controller.fats.toPrecision(2)}"),
                              CustomText(
                                  title:
                                      "بروتين:  ${controller.protein.toPrecision(2)}"),
                              CustomText(
                                  title:
                                      "كالوريز:  ${controller.calories.toPrecision(2)}")
                            ],
                          ),
                        );
                      }),
                  SizedBox(height: 100),
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            final controller = Get.find<CompleteMaleController>();

            controller.onSaveUpdatedCompleteMale();

            Get.back();
            Get.find<MyMalesCurrentDietController>().update();
          },
          label: CustomText(title: "حفظ"),
          backgroundColor: AppColors.buttonColor),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class Painter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
   var h = size.height;
   var w = size.width;

  canvas.drawArc(Rect.fromCircle(center: Offset(-10,h/2,), radius:15), 0,10,false, Paint()..style = PaintingStyle.fill..color = Colors. white);
  //  var painter = canvas...color= AppColors.doneColor;
  canvas.drawArc(Rect.fromCircle(center: Offset(w+10,h/2,), radius:15), 0,10,false, Paint()..style = PaintingStyle.fill..color = Colors. white);
  canvas.drawArc(Rect.fromCircle(center: Offset((4*w)/5,(h+5),), radius:7), 0,10,false, Paint()..style = PaintingStyle.fill..color = Colors. white);
  canvas.drawArc(Rect.fromCircle(center: Offset(4*w/5,-5,), radius:7), 0,10,false, Paint()..style = PaintingStyle.fill..color = Colors. white);
    
    
    }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }

  
}
  class DashedPath extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
 double dashwidth =3;
 double  dashspace =4;
  double starty = 10;
  double startx = 10;
  final paint = Paint()
  ..color= Colors.white..strokeWidth=1;
    while(starty <size.height -10){
      canvas.drawCircle(Offset(size.width-70,starty), 2, paint);
      starty +=dashwidth+dashspace;
    }     
    while( startx <size.width -80 ){
     canvas.drawCircle(Offset(startx,30), 2, paint);
       startx +=dashwidth+dashspace;
    }
     }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
  return false;
    }
    
  }