import 'package:flutter/material.dart';

import 'custom_text.dart';
class CustomOptionProfile extends StatelessWidget {
  final String title;
  final IconData icon;
  var function;


   CustomOptionProfile({
    required this.title,
    required this.icon,
    this.function
  });


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,color: Colors.white,),
        const SizedBox(
          width: 20,
        ),
        CustomText(title: title, fontSize: 16),
        Spacer(),
        IconButton(onPressed: function, icon: Icon(Icons.arrow_forward_ios,color: Colors.white,)),

      ],
    );
  }
}
