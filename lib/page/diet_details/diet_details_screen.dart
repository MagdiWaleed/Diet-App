import 'package:diet_app2/page/diet_details/diet_detials_controller.dart';
import 'package:diet_app2/page/my_informations/my_males_current_diet/my_males_current_diet_controller.dart';
import 'package:diet_app2/theme/app_colors.dart';
import 'package:diet_app2/widget/custom_text.dart';
import 'package:diet_app2/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
class DietDetailsScreen extends StatelessWidget {
   DietDetailsScreen({super.key});
  final myDietController = Get.put(MyMalesCurrentDietController());
  
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(children: [
          Divider(thickness: 1,
                      height: 2,
                      color: Colors.white,),
         Row(
                        children: [
                          Expanded(
                            child:  GestureDetector(
                              onTap: () {
                                  myDietController.changeToMales();
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(vertical: 15),
                                decoration: BoxDecoration(
                                    color: AppColors.buttonColor,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15))),
                                child: CustomText(title: "الوجبات"),
                              ),
                            ),
                          ),
                        ],
                      ),
      
                    GetBuilder<DietDetialsController>(
                      init: DietDetialsController(),
                      builder: (controller ) =>
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                           
                        for (int i = -2; i < controller.compoenent_names.length;i++)
                          if (i==-2)
                            Card(
                              color: AppColors.buttonColor,
                                  child: Container(
                                    padding:EdgeInsets.all(10),
                                
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children:[
                                          CustomText(title: "توتال السعر: ",color: Colors.white,),
                                          SizedBox(width: 20),
                                         ]),
                                        SizedBox(height: 10,),
                                        Row(
                                          children: [
                                              CustomText(title: "سعر المكونات في اليوم:   ",color: Color.fromARGB(255, 30, 50, 80) ,size: 10,)
                                             , CustomText(title: "250",color: Colors.white,size: 10,)
                                        ],
                                        ),
                                        Divider(thickness: 0.5,color: Colors.white,)
                                       ,Row(
                                          children: [
                                              CustomText(title: "سعر المكونات في الاسبوع:   ",color: Color.fromARGB(255, 30, 50, 80) ,size: 10,)
                                             , CustomText(title: "250",color: Colors.white,size: 10,)
                                        ],
                                        ), Divider(thickness: 0.5,color: Colors.white,)
                                       ,Row(
                                          children: [
                                              CustomText(title: "سعر المكونات في الشهر:   ",color: Color.fromARGB(255, 30, 50, 80) ,size: 10,)
                                             , CustomText(title: "250",color: Colors.white,size: 10,)
                                        ],
                                        ),Divider(thickness: 0.5,color: Colors.white,)
                                      ],
                                    ),
                                  ),)
                                  else if(i==-1)
                                  Container(color: AppColors.buttonColor,height: 30,width: double.infinity,margin: EdgeInsets.symmetric(horizontal: 10),
                                  child: Center(child: CustomText(title: "المكونات")),)
                                  else
                               Card(
                                  child: Container(
                                    padding:EdgeInsets.all(10),
                                
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(children:[
                                          CustomText(title: "النسبة بعد الطبخ: ",size:11,color: Colors.black,),
                                          SizedBox(width: 2),
                                          Container(
                                            
                                            width: 60,
                                            height: 30,
                                            child: CustomTextField(title: "ج",controller: controller.portionControllers[i],)),
                                            SizedBox(width: 50),
                                           CustomText(
                                            title: controller.compoenent_names[i],
                                            color: AppColors.buttonColor,
                                            ),
                                            Spacer(),
                                          CustomText(title: controller.component_weights[i].toPrecision(2).toString(),color: AppColors.buttonColor,size: 12,),
                                          CustomText(title: "جرام",color: AppColors.buttonColor,size: 12,)
                                        ]),
                                        SizedBox(height: 10,),
                                        Row(
                                          children: [
                                              CustomText(title: "سعر المكونات في اليوم:   ",color: const Color.fromARGB(255, 0, 0, 0) ,size: 10,)
                                             , CustomText(title: controller.getComponentDetails(i).getPriceForDay().toString(),color: AppColors.buttonColor,size: 10,)
                                        ],
                                        ),
                                        Divider(thickness: 0.5,color: AppColors.buttonColor,)
                                       ,Row(
                                          children: [
                                              CustomText(title: "سعر المكونات في الاسبوع:   ",color: const Color.fromARGB(255, 0, 0, 0) ,size: 10,)
                                             , CustomText(title: controller.getComponentDetails(i).getPriceForWeek().toString(),color: AppColors.buttonColor,size: 10,)
                                        ],
                                        ), Divider(thickness: 0.5,color: AppColors.buttonColor,)
                                       ,Row(
                                          children: [
                                              CustomText(title: "سعر المكونات في الشهر:   ",color: const Color.fromARGB(255, 0, 0, 0) ,size: 10,)
                                             , CustomText(title: controller.getComponentDetails(i).getPriceForMonth().toString(),color: AppColors.buttonColor,size: 10,)
                                        ],
                                        ),
                                        Divider(thickness: 0.5,color: AppColors.buttonColor,),
                                        Row(
                                          children: [
                                            CustomText(title: "السعر:   ",color:Colors.black),
                                                Container( 
                                              height: 30,
                                              width: 280,
                                              child: CustomTextField(title: "",controller: controller.priceControllers[i],)),
                                          ],
                                        ),
                                        Divider(thickness: 0.5,color: AppColors.buttonColor,)
                                      ],
                                    ),
                                  ),),
                                   Container(color: AppColors.buttonColor,height: 30,width: double.infinity,margin: EdgeInsets.symmetric(horizontal: 10),
                                  child: Center(child: CustomText(title: "الوجبات الكاملة")),)
                                 , for(int i =0;i<3;i++)
                                   Card(
                                  child: Container(
                                    padding:EdgeInsets.all(10),
                                
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(children:[
                                          CustomText(title: "الوجبة الاولى ",color: Colors.black,),
                                          SizedBox(width: 20),
                                          
                                            Spacer(),
                                          CustomText(title: "250",color: AppColors.buttonColor,size: 12,),
                                          CustomText(title: "كالوريز",color: AppColors.buttonColor,size: 12,)
                                        ]),
                                        SizedBox(height: 10,),
                                        for(int j=0;j<3;j++)
                                        Column(
                                          children: [
                                            Row(
                                          children: [
                                              CustomText(title: "سعر المكونات #${j+1}:   ",color: const Color.fromARGB(255, 0, 0, 0) ,size: 10,)
                                             , CustomText(title: "250",color: AppColors.buttonColor,size: 10,)
                                      ,Spacer(),
                                             CustomText(title: "250",color: AppColors.buttonColor,size: 10,)
                                             ,  CustomText(title: "جرام",color: AppColors.buttonColor ,size: 10,)
                                       ],
                                        ),Divider(thickness: 0.5,color: AppColors.buttonColor,)
                                      ],
                                    ),]
                                  ),),

                    ),],),)
      ,SizedBox(height: 80,)],),
    );
  }
}