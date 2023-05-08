import 'package:flutter/material.dart';

import '../constant/constant.dart';
class CustomButton extends StatelessWidget {
  final String title;
  var function;
  CustomButton({
    required this.title,
    this.function
});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height:50,

      decoration: BoxDecoration(
          color: secondColor,
          borderRadius: BorderRadius.circular(10)
      ),
      child: TextButton(
        onPressed: function,
        child:  Text(title,style: const TextStyle(
          color: Colors.white,
        ),),
      ),
    );
  }
}
