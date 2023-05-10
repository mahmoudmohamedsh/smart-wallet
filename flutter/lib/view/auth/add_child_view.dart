import 'package:flutter/material.dart';
import 'package:orange_project/constant/constant.dart';
import 'package:orange_project/widget/custom_button.dart';

import '../../widget/custom_icon_button.dart';
import '../../widget/custom_text.dart';
import '../layout_view.dart';

class AddChildView extends StatefulWidget {
  const AddChildView({Key? key}) : super(key: key);

  @override
  State<AddChildView> createState() => _AddChildViewState();
}

class _AddChildViewState extends State<AddChildView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
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
                      screen: LayoutView()
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CustomText(title: 'Add child', fontSize: 20,),
                ],
              ),
              const SizedBox(
                height: 20,
              ),


              // child account

              CustomText(title: 'Child Account', fontSize: 20),
              CustomText(title: 'Now with Top cash you can easily add your children wallet', fontSize: 12,color: thirdColor,),

              const SizedBox(
                height: 20,
              ),

              //choose gender

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 156,
                    height: 198,
                    decoration: BoxDecoration(
                      color: thirdColor,
                      borderRadius: BorderRadius.circular(8)
                    ),

                    child: Column(
                      children: [
                        Row(
                          children: [
                            Checkbox(value: true, onChanged: (value){}),
                            CustomText(title: 'Boy', fontSize: 15)
                          ],
                        ),
                        Expanded(child: Image.asset(
                            'assets/images/boy1.png'
                        ),),


                      ],
                    ),
                  ),
                  Container(
                    width: 156,
                    height: 198,
                    decoration: BoxDecoration(
                        color: thirdColor,
                        borderRadius: BorderRadius.circular(8)
                    ),

                    child: Column(
                      children: [
                        Row(
                          children: [
                            Checkbox(value: false, onChanged: (value){}),
                            CustomText(title: 'Girl', fontSize: 15)
                          ],
                        ),
                        Expanded(child: Image.asset(
                            'assets/images/girl1.png'
                        ),),


                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              CustomButton(title: 'Next'),
             


            ],






          ),
        ),
      ),
    );
  }
}
