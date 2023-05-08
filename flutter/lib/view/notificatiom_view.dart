import 'package:flutter/material.dart';
import 'package:orange_project/view/home_view.dart';
import 'package:orange_project/widget/custom_button.dart';
import 'package:orange_project/widget/custom_item_list.dart';
import 'package:orange_project/widget/custom_text.dart';

import '../widget/custom_icon_button.dart';
import '../widget/custom_recent_transaction.dart';
import 'layout_view.dart';
class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body:Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  CustomText(title: 'Notification', fontSize: 20,),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              CustomText(title: 'Today', fontSize: 15),
              SizedBox(
                height: 10,
              ),
              CustomRecentTransaction(
                name: 'Karma ask you to recharge her wallet',
                time: '09:40',
                image: 'assets/images/1.jpg',
                price: '',
              ),
              SizedBox(
                height: 20,
              ),
              CustomRecentTransaction(
                name: 'Karma ask you to recharge her wallet',
                time: '09:40',
                image: 'assets/images/1.jpg',
                price: '',
              ),
              SizedBox(
                height: 20,
              ),

              // history
              Row(
                children: [
                  CustomText(title: 'Yasterday', fontSize: 15),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      
                      height: 1,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              CustomRecentTransaction(
                name: 'Karma ask you to recharge her wallet',
                time: '09:40',
                image: 'assets/images/1.jpg',
                price: '',
              ),
              SizedBox(
                height: 20,
              ),
              CustomRecentTransaction(
                name: 'Karma ask you to recharge her wallet',
                time: '09:40',
                image: 'assets/images/1.jpg',
                price: '',
              ),
              SizedBox(
                height: 20,
              ),


            ],
          ),
        ),
      ),
    );
  }
}
