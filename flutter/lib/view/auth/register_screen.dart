import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:orange_project/view/home_view.dart';

import '../../constant/constant.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_form_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset('assets/images/Splash1.png',fit: BoxFit.cover,),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child:  Text('Register',style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                     CustomFormField(
                      title: 'Name',
                      hint: 'full nam',
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                     CustomFormField(
                      title: 'Email',
                      hint: 'example@gmail.com',
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                     CustomFormField(
                      title: 'password',
                      hint: '**********',
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                     CustomFormField(
                      title: 'Confirm password',
                      hint: '**********',
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children:  [
                          Checkbox(
                              value: isChecked,
                              fillColor: MaterialStateColor.resolveWith((states) => secondColor),
                              onChanged: (value){
                                setState(() {
                                  isChecked=value!;
                                });

                              }),
                          const Text('Accept Terms of Use & Privacy Policy',style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,

                          ),),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      title: 'Sign Up',
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        const Text('Do you have an account?',style: TextStyle(
                            color: Colors.white
                        ),),
                        TextButton(onPressed: (){
                          Get.to(HomeScreen());
                        },
                        child: const Text('Sign in now',style: TextStyle(color: secondColor),))
                      ],
                    ),




                  ],
                ),
              ),
            ),
          ),
        ],

      ),
    );
  }
}
