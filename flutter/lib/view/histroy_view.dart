import 'package:flutter/material.dart';
import 'package:orange_project/view/home_view.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../constant/constant.dart';
import '../widget/custom_icon_button.dart';
import '../widget/custom_recent_transaction.dart';
import '../widget/custom_text.dart';
import '../widget/custom_transfer_item.dart';
import 'layout_view.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:  Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              //back button and title
              Row(
                children: [
                  CustomIconButton(
                      icon: Icons.arrow_back_ios_new_outlined,
                      screen:LayoutView()
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CustomText(title: 'History', fontSize: 20,),
                ],
              ),
              const SizedBox(
                height: 20,
              ),



              // graph

              Container(
                width: double.infinity,
                height: 380,
                color: Color.fromRGBO(29, 31, 36, 1),

                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [


                      Row(
                        children: [
                          CustomText(title: 'Transaction', fontSize: 17),
                          Spacer(),
                          Container(
                            decoration: BoxDecoration(
                              color: hintFormColor,
                              borderRadius: BorderRadius.circular(10)
                            ),

                            width: 80,
                            height: 25,
                            child: Center(
                              child: CustomText(
                                title: ' Weekly >',
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      //graph
                      Center(
                          child: Container(
                              child: SfCartesianChart(
                               plotAreaBorderColor: secondColor,
                                // Initialize category axis
                                  primaryXAxis: CategoryAxis(),
                                  series: <LineSeries<TransactionData, String>>[
                                    LineSeries<TransactionData, String>(
                                      // Bind data source
                                        dataSource:  <TransactionData>[
                                          TransactionData('sun', 80),
                                          TransactionData('mon', 50),
                                          TransactionData('Tue', 75),
                                          TransactionData('Wed', 80),
                                          TransactionData('Fri', 50),
                                          TransactionData('Sat', 90),

                                        ],

                                        xValueMapper: (TransactionData transaction, _) => transaction.week,
                                        yValueMapper: (TransactionData transaction, _) => transaction.transaction
                                    )
                                  ]
                              )
                          )
                      ),
                    ],
                  ),
                )
              ),
              const SizedBox(
                height: 20,
              ),


              //income and out come
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 165,
                    height: 63,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: thirdColor
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.arrow_downward_outlined,color: secondColor,),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(title: '20.00 EGP', fontSize: 14),
                            CustomText(title: 'income', fontSize: 16,color: secondColor,)
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 165,
                    height: 63,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: thirdColor
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.arrow_upward,color: secondColor,),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(title: '20.00 EGP', fontSize: 14),
                            CustomText(title: 'Outcome', fontSize: 16,color: secondColor,)
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),


              //Recent Transaction
              CustomText(title: 'Recent Transaction', fontSize: 20),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: 165,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: secondColor
                      ),
                      child:Center(child: CustomText(title: 'Outcome', fontSize: 16,color: Colors.white,))

                  ),
                  Container(
                    width: 165,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: thirdColor
                    ),
                    child:Center(child: CustomText(title: 'Outcome', fontSize: 16,color: secondColor,))

                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              const CustomRecentTransaction(
                name: 'To Abdo Al3nani',
                image: 'assets/images/1.jpg',
                time: 'Today  7:30 pm',
                price: '+ 500 EGP',
              ),
              SizedBox(
                height: 10,
              ),
              const CustomRecentTransaction(
                name: 'To Abdo Al3nani',
                image: 'assets/images/1.jpg',
                time: 'Today  7:30 pm',
                price: '+ 500 EGP',
              ),
              SizedBox(
                height: 10,
              ),
              const CustomRecentTransaction(
                name: 'To Abdo Al3nani',
                image: 'assets/images/1.jpg',
                time: 'Today  7:30 pm',
                price: '+ 500 EGP',
              ),
              SizedBox(
                height: 10,
              ),
              const CustomRecentTransaction(
                name: 'To Abdo Al3nani',
                image: 'assets/images/1.jpg',
                time: 'Today  7:30 pm',
                price: '+ 500 EGP',
              ),
              SizedBox(
                height: 10,
              ),
              const CustomRecentTransaction(
                name: 'To Abdo Al3nani',
                image: 'assets/images/1.jpg',
                time: 'Today  7:30 pm',
                price: '+ 500 EGP',
              ),


            ],






          ),
        ),
      ),
    );
  }
}

 class TransactionData {
  TransactionData(this.week, this.transaction);
  final String week;
  final double transaction;
}

