import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:orange_project/widget/custom_button.dart';
import 'package:orange_project/widget/custom_form_field.dart';

import '../constant/constant.dart';
import '../widget/custom_icon_button.dart';
import '../widget/custom_text.dart';
import 'layout_view.dart';
class BillView extends StatelessWidget {
  final data =[
    {
      'study':'kids',
      'student':40,
    },
    {
      'study':'more',
      'student':50,
    },

  ];
  final String title;
  BillView({
    required this.title
});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body:Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Column(
                children: [
                  Row(
                    children: [
                      CustomIconButton(
                          icon: Icons.arrow_back_ios_new_outlined,
                          screen: LayoutView()
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      CustomText(title: '$title Bill', fontSize: 20,),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // chart
                  Container(
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                        color: thirdColor,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(title: '$title Bill', fontSize: 20,),
                          AspectRatio(
                            aspectRatio: 16/9,
                            child: Container(
                              child: Stack(
                                children: [
                                  DChartPie(
                                    data:data.map((e) {
                                      return {'domain':e['study'] , 'measure' :e['student']};
                                    }).toList(),
                                    fillColor: (pieData, index) {
                                      switch(pieData['domain']){
                                        case 'kids' :
                                          return secondColor;
                                        default:
                                          return hintFormColor;
                                      }
                                    },
                                    labelColor: Colors.white,
                                    labelPosition: PieLabelPosition.outside,
                                    labelFontSize: 20,
                                    labelLineColor: Colors.grey,
                                    labelLineThickness: 3,
                                    labelLinelength: 20,
                                    labelPadding: 0,
                                    strokeWidth: 0,
                                    donutWidth: 20,
                                  ),
                                  Center(
                                    child: Container(

                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          CustomText(
                                            title: '6 870 EGP',
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),
                                          CustomText(
                                            title: 'Total',
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),




                        ],
                      ),
                    ),
                  ),

                  //fields

                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                   children: [
                     CustomFormField(
                         title: 'Code Number',
                         hint: 'Number id'
                     ),
                     SizedBox(
                       height: 10,
                     ),
                     CustomFormField(
                         title: 'Password',
                         hint: '************'
                     ),
                     SizedBox(
                       height: 10,
                     ),
                     CustomFormField(
                         title: 'Bill Amount',
                         hint: '0000'
                     ),
                   ],
             ),
                ],
              ),

              //bottom

              CustomButton(title: 'Next'),


            ],
          ),
        ),
      ),
    );
  }
}
