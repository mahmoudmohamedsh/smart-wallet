import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:orange_project/view/auth/otp_screen.dart';
import 'package:orange_project/view/home_view.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


import '../../constant/constant.dart';
import '../../view_model/auth_view_model.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_form_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isChecked = false;

  late String name,email,password,confirmPassword,otp='106209';

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

                    //Register
                    const Center(
                      child:  Text('Register',style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),),
                    ),


                    //fields
                    const SizedBox(
                      height: 20,
                    ),
                     CustomFormField(
                       functionchange: (value){
                           name=value;
                       },

                       title: 'Name',
                      hint: 'full nam',
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                     CustomFormField(
                       functionchange: (value){
                         email=value;
                       },

                       title: 'Email',
                      hint: 'example@gmail.com',
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                     CustomFormField(
                       functionchange: (value){
                         password=value;
                       },

                       title: 'password',
                      hint: '**********',
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                     CustomFormField(
                       functionchange: (value){
                         confirmPassword=value;
                       },

                       title: 'Confirm password',
                      hint: '**********',
                    ),


                    //check box
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



                    //sign up button
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      title: 'Sign Up',
                      function: (){
                        //print(name);
                        //print(email);
                        //print(password);
                        //print(confirmPassword);
                        signupVerify(email);

                        Get.to(OtpScreen(email: email,name: name,password: password,));

                       // signup(email,password,otp,name);
                      },
                    ),


                    //sign in now
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
