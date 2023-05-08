import 'package:flutter/material.dart';

import '../constant/constant.dart';
import 'custom_text.dart';
class CustomRecentTransaction extends StatelessWidget {
  final String image;
  final String name;
  final String time;
  final String price;

  const CustomRecentTransaction({
    required this.image,
    required this.name,
    required this.time,
     required this.price
  });

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(image),
            ),
            SizedBox(
              width: 10,
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(title: name, fontSize: 15 , color: Colors.white,),
                SizedBox(
                  height: 10,
                ),
                CustomText(title: time, fontSize: 10,color: hintFormColor,)
              ],
            ),
          ],
        ),

        CustomText(title: price, fontSize: 20 , color: Colors.white,)
      ],
    );
  }
}
