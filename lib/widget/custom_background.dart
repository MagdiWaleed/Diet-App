import 'package:flutter/material.dart';

class CustomBackground extends StatefulWidget {
  const CustomBackground({super.key, required this.child});
  final Widget child;

  @override
  State<CustomBackground> createState() => _CustomBackgroundState();
}

class _CustomBackgroundState extends State<CustomBackground> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              // image: DecorationImage(
              //   image: AssetImage("asset/image/main_screen_image.jpg"),
              //   fit: BoxFit.cover,
              // ),
              color: Colors.white),
        ),
        widget.child
      ],
    );
  }
}
