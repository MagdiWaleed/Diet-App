import 'package:diet_app2/page/loading/loading_controller.dart';
import 'package:diet_app2/service/males_repository.dart';
import 'package:diet_app2/service/user_service.dart';
import 'package:diet_app2/theme/app_colors.dart';
import 'package:diet_app2/widget/custom_background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoadingScreen extends StatelessWidget {
  LoadingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoadingController>(
        init: LoadingController(),
        builder: (_) {
          return Container(
              color: Colors.white,
              height: double.infinity,
              width: double.infinity,
              child: Center(
                child: Center(
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
                ),
              ));
        },
      ),
    );
  }
}
