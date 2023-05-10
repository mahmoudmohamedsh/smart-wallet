import 'package:flutter/material.dart';

import '../constant/constant.dart';
import 'custom_text.dart';
class CustomTransferItem extends StatelessWidget {
  final String image;
  CustomTransferItem({
    required this.image
});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: 81,
      decoration: BoxDecoration(
          color: thirdColor,
          borderRadius: BorderRadius.circular(8)
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Checkbox(
            value: false,
            onChanged: (value){},
            shape: CircleBorder(),

          ),
          const SizedBox(
            width: 20,
          ),
          Center(
            child: Container(
                width: 50,
                height: 50,
                child: Image.asset(image)),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(title: '****** 7847', fontSize: 15 ,color: hintFormColor,),
              CustomText(title: '4 8883.74 EGP', fontSize: 16)
            ],
          ),

        ],
      ),

    );
  }
}
