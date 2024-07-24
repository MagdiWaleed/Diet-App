import 'package:diet_app2/theme/app_colors.dart';
import 'package:diet_app2/widget/custom_text.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
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
        title: CustomText(title: "تصميماتي"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 100),
          ElevatedButton(
            onPressed: () {
              AppColors.buttonColor = Colors.green;
              setState(() {});
            },
            child: CustomText(title: "title"),
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.green)),
          ),
          ElevatedButton(
            onPressed: () {
              AppColors.buttonColor = Colors.red;
              setState(() {});
            },
            child: CustomText(title: "title"),
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.red)),
          ),
          ElevatedButton(
            onPressed: () {
              AppColors.buttonColor = Colors.blueAccent;
              setState(() {});
            },
            child: CustomText(title: "title"),
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.blueAccent)),
          ),
          ElevatedButton(
            onPressed: () {
              AppColors.buttonColor = Colors.purple;
              setState(() {});
            },
            child: CustomText(title: "title"),
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.purple)),
          ),
          ElevatedButton(
            onPressed: () {
              AppColors.buttonColor = Colors.amber;
              setState(() {});
            },
            child: CustomText(title: "title"),
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.amber)),
          ),
          ElevatedButton(
            onPressed: () {
              AppColors.buttonColor = Colors.black;
              setState(() {});
            },
            child: CustomText(title: "title"),
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.black)),
          ),
        ],
      ),
    );
  }
}
