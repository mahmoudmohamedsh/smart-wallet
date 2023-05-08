import 'package:flutter/material.dart';

import '../constant/constant.dart';

class Data {
  final String name;
  final double percent;
  final Color color ;

  Data({
    required this.name,
    required this.percent,
    required this.color
});
}
class PieData{
  static List <Data> data =[
    Data(name: 'red', percent: 40, color:secondColor),
    Data(name: 'Blue', percent: 30, color: Colors.yellow),
    Data(name: 'black', percent: 15, color: thirdColor),
    Data(name: 'green', percent: 15, color: Colors.red),
  ];
}

