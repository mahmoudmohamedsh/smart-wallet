import 'package:flutter/material.dart';
import 'package:orange_project/constant/constant.dart';
class CustomText extends StatelessWidget {
 final String title;
 final double fontSize;
 final Color color;

 CustomText({
   required this.title,
    this.color=Colors.white, //initialize color default
   required this.fontSize
});
  @override
  Widget build(BuildContext context) {
    return Text(title,style: TextStyle(
        color: color,
        fontSize: fontSize,
    ),);
  }
}
