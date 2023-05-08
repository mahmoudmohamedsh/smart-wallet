import 'package:flutter/material.dart';

import '../constant/constant.dart';
import 'custom_text.dart';
class CustomItemList extends StatelessWidget {
  final String title;
  final IconData icon;
   var function;

  CustomItemList({
    required this.title,
    required this.icon,
    required this.function
});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Column(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
                color: thirdColor,
                borderRadius: BorderRadius.circular(14)
            ),
            child: Icon(icon,color: secondColor,size: 20,),
          ),
          SizedBox(
            height: 10,
          ),
          CustomText(title: title, fontSize: 14 , color: hintFormColor,),
        ],
      ),
    );
  }
}
