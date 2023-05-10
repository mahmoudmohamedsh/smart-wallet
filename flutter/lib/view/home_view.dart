import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:orange_project/view/bill_view.dart';
import '../constant/constant.dart';
import '../view_model/user_view_model.dart';
import '../widget/custom_item_list.dart';
import '../widget/custom_recent_transaction.dart';
import '../widget/custom_text.dart';
import 'notificatiom_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final data =[
    {
      'category':'kids',
      'money':50,
    },
    {
      'category':'shopping',
      'money':12.5,
    },
    {
      'category':'bills',
      'money':20,
    },
    {
      'category':'more',
      'money':8.5,
    },

  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              //information user
              AspectRatio(
                aspectRatio: 16/5,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [

                        Row(
                          children: [
                            const CircleAvatar(
                              backgroundImage: AssetImage('assets/images/1.jpg')
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                CustomText(
                                  title: 'Hi, Abdelhady',
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                                CustomText(
                                  title: 'Account id: ip-4554125',
                                  fontSize: 15,
                                  color:secondColor ,
                                ),
                              ],
                            ),
                          ],
                        ),

                        IconButton(
                            icon: Icon(Icons.add_alert_outlined,color: Colors.white,),
                            onPressed: (){
                              Get.to(NotificationView());
                            },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          title: 'Available balance',
                          fontSize: 20,
                          color: Colors.white,
                        ),
                        CustomText(title: 'More Details', color: Colors.white, fontSize: 12)
                      ],
                    ),
                  ],
                ),
              ),


              //Available balance (pie chart)
              AspectRatio(
                aspectRatio: 16/9,
                child: Container(
                  child: Stack(
                    children: [
                      DChartPie(
                        data:data.map((e) {
                          return {'domain':e['category'] , 'measure' :e['money']};
                        }).toList(),
                        fillColor: (pieData, index) {
                          switch(pieData['domain']){
                            case 'kids' :
                              return secondColor;
                            case 'shopping' :
                              return Colors.amber;
                            case 'bills' :
                              return Colors.red;
                            default:
                              return thirdColor;
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              title: '6 870 EGP',
                              fontSize: 20,
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
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: secondColor,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      CustomText(title: 'kids', fontSize: 15,color: Colors.white),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.amber,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      CustomText(title: 'Shopping', fontSize: 15,color: Colors.white),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.red,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      CustomText(title: 'Bills', fontSize: 15,color: Colors.white),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),


              //payment List
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: CustomText(
                      title: 'Payment List',
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomItemList(
                        function: (){
                          Get.to(BillView(title:'Electricty' ,));
                        },
                        title: 'Electricty',
                        icon: Icons.electric_bolt_outlined,
                      ),
                      CustomItemList(
                        function: (){
                          Get.to(BillView(title: 'internet',));
                        },
                        title: 'internet',
                        icon: Icons.wifi,
                      ),
                      CustomItemList(
                        function: (){
                          Get.to(BillView(title:'Water',));
                        },
                        title: 'Water',
                        icon: Icons.water_drop_rounded,
                      ),
                      CustomItemList(
                        function: (){
                          Get.to(BillView(title:'transfer' ,));
                        },
                        title: 'transfer',
                        icon: Icons.compare_arrows_outlined,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomItemList(
                        function: (){
                          Get.to(BillView(title:'Merchant' ,));
                        },
                        title: 'Merchant',
                        icon: Icons.shopping_cart,
                      ),
                      CustomItemList(
                        function: (){
                          Get.to(BillView(title:'Mobile Credit' ,));
                        },
                        title: 'Mobile\n Credit',
                        icon: Icons.phone_iphone_outlined,
                      ),
                      CustomItemList(
                        function: (){
                          Get.to(BillView(title:'Bill' ,));
                        },
                        title: 'Bill',
                        icon: Icons.receipt_long_outlined,
                      ),
                      CustomItemList(
                        function: (){
                          Get.to(BillView(title: 'more',));
                        },
                        title: 'more',
                        icon: Icons.more_vert_rounded,
                      ),
                    ],
                  ),

                ],
              ),


              //Recent Transaction
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: CustomText(
                      title: 'Recent Transaction',
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 15,
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

            ],
          ),
        ),
      ),
    );
  }
}
