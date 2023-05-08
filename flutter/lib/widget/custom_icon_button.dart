import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../view/notificatiom_view.dart';
class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final Widget screen;

  CustomIconButton({
    required this.icon,
    required this.screen
});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(icon,color: Colors.white,),
    onPressed: (){
    Get.to(screen);
    }
    );
  }
}
