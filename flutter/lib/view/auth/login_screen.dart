import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:orange_project/view/auth/register_screen.dart';

import '../../constant/constant.dart';
import '../../view_model/auth_view_model.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);



  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;
  var email = TextEditingController();
  var password =TextEditingController();
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
                    // Login
                    const Center(
                      child:  Text('Login',style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),),
                    ),
                    const SizedBox(
                      height: 20,
                    ),


                     CustomFormField(

                      title: 'Email',
                      hint: 'example@gmail.com',
                       controller: email,
                       saved: (value){
                        print('value');
                       },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                     CustomFormField(
                      title: 'password',
                      hint: '**********',
                       controller: password,
                       saved: (value){
                         print('value');
                       },
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
                          const Text('Remember me',style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,

                          ),),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    CustomButton(
                      title: 'login',
                      function: (){
                        print(email);
                        print(password);
                        print('hello');
                        signIn();
                        print('hello22');
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      child: const Text('Forget password?',style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,

                      ),),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            color: thirdColor,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text('OR',style: TextStyle(color:secondColor),),
                        ),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: thirdColor,
                          ),
                        ),

                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: (){},
                      child: Container(
                        width: double.infinity,
                        height: 57,
                        decoration: BoxDecoration(
                            color: thirdColor,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            Container(
                              width: 22,
                              height: 22,
                              child: Image.asset('assets/images/google.png'),

                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text('Login with Google',style: TextStyle(color: Colors.white),)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        const Text('Not register yet?',style: TextStyle(
                            color: Colors.white
                        ),),
                        TextButton(onPressed: (){
                          Get.to(RegisterScreen());
                        }, child: const Text('Create an Account',style: TextStyle(color: secondColor),))
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
