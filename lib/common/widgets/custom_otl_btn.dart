import 'package:flow_plan/common/widgets/app_style.dart';
import 'package:flow_plan/common/widgets/reusable_text.dart';
import 'package:flutter/material.dart';

class CustomOutlineBtn extends StatelessWidget {
  const CustomOutlineBtn({
    super.key,
    this.onTap,
    required this.width,
    required this.height,
    required this.color,
    required this.text,
    this.color2,
  });

  final void Function()? onTap;
  final double width;
  final double height;
  final Color? color2;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color2,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 1, color: color),
        ),
        child: Center(
          child: ReusableText(
            text: text,
            style: appStyle(18, color, FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
