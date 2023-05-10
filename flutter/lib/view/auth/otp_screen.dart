import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:orange_project/constant/constant.dart';
import 'package:orange_project/view/auth/register_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../view_model/auth_view_model.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_icon_button.dart';
import '../../widget/custom_text.dart';
import '../layout_view.dart';
import 'login_screen.dart';
class OtpScreen extends StatelessWidget {
  final String name;
  final String email;
  final String password;
  var otp;
  var response;


  OtpScreen({
    required this.email,
    required this.name,
    required this.password
});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(

            children: [

              //back button and title
              Row(
                children: [
                  CustomIconButton(
                      icon: Icons.arrow_back_ios_new_outlined,
                      screen: RegisterScreen()
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CustomText(title: 'confirm Account', fontSize: 20,),
                ],
              ),
              const SizedBox(
                height: 20,
              ),

              //Text
              CustomText(
                title: 'Enter your OTP',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomText(
                title: 'please enter your OTP to confirm Account',
                fontSize: 14,
                color: thirdColor,
              ),
              const SizedBox(
                height: 84,
              ),

              // otp fields
              // Form(child: Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Container(
              //         width: 49,
              //         height: 49,
              //         decoration: BoxDecoration(
              //           color: Colors.white,
              //           borderRadius: BorderRadius.circular(10),
              //         ),
              //         child: Center(
              //           child: TextFormField(
              //             decoration: InputDecoration(hintText: '0'),
              //             onSaved: (pin1){
              //             },
              //
              //             style:  const TextStyle(
              //                 fontSize: 25,
              //                 fontWeight: FontWeight.bold,
              //                 color: Colors.black
              //             ),
              //             onChanged: (value){
              //               if(value.length==1){
              //                 FocusScope.of(context).nextFocus();
              //               }
              //             },
              //             textAlign: TextAlign.center,
              //             inputFormatters: [
              //               LengthLimitingTextInputFormatter(1),
              //               FilteringTextInputFormatter.digitsOnly
              //             ],
              //           ),
              //         )
              //     ),
              //     Container(
              //         width: 49,
              //         height: 49,
              //         decoration: BoxDecoration(
              //           color: Colors.white,
              //           borderRadius: BorderRadius.circular(10),
              //         ),
              //         child: Center(
              //           child: TextFormField(
              //             decoration: InputDecoration(hintText: '0'),
              //             onSaved: (pin2){
              //             },
              //
              //             style:  const TextStyle(
              //                 fontSize: 25,
              //                 fontWeight: FontWeight.bold,
              //                 color: Colors.black
              //             ),
              //             onChanged: (value){
              //               if(value.length==1){
              //                 FocusScope.of(context).nextFocus();
              //               }
              //             },
              //             textAlign: TextAlign.center,
              //             inputFormatters: [
              //               LengthLimitingTextInputFormatter(1),
              //               FilteringTextInputFormatter.digitsOnly
              //             ],
              //           ),
              //         )
              //     ),
              //     Container(
              //         width: 49,
              //         height: 49,
              //         decoration: BoxDecoration(
              //           color: Colors.white,
              //           borderRadius: BorderRadius.circular(10),
              //         ),
              //         child: Center(
              //           child: TextFormField(
              //             decoration: InputDecoration(hintText: '0'),
              //             onSaved: (pin3){
              //             },
              //
              //             style:  const TextStyle(
              //                 fontSize: 25,
              //                 fontWeight: FontWeight.bold,
              //                 color: Colors.black
              //             ),
              //             onChanged: (value){
              //               if(value.length==1){
              //                 FocusScope.of(context).nextFocus();
              //               }
              //             },
              //             textAlign: TextAlign.center,
              //             inputFormatters: [
              //               LengthLimitingTextInputFormatter(1),
              //               FilteringTextInputFormatter.digitsOnly
              //             ],
              //           ),
              //         )
              //     ),
              //     Container(
              //         width: 49,
              //         height: 49,
              //         decoration: BoxDecoration(
              //           color: Colors.white,
              //           borderRadius: BorderRadius.circular(10),
              //         ),
              //         child: Center(
              //           child: TextFormField(
              //             decoration: InputDecoration(hintText: '0'),
              //             onSaved: (pin4){
              //             },
              //
              //             style:  const TextStyle(
              //                 fontSize: 25,
              //                 fontWeight: FontWeight.bold,
              //                 color: Colors.black
              //             ),
              //             onChanged: (value){
              //               if(value.length==1){
              //                 FocusScope.of(context).nextFocus();
              //               }
              //             },
              //             textAlign: TextAlign.center,
              //             inputFormatters: [
              //               LengthLimitingTextInputFormatter(1),
              //               FilteringTextInputFormatter.digitsOnly
              //             ],
              //           ),
              //         )
              //     ),
              //     Container(
              //         width: 49,
              //         height: 49,
              //         decoration: BoxDecoration(
              //           color: Colors.white,
              //           borderRadius: BorderRadius.circular(10),
              //         ),
              //         child: Center(
              //           child: TextFormField(
              //             decoration: InputDecoration(hintText: '0'),
              //             onSaved: (pin5){
              //             },
              //
              //             style:  const TextStyle(
              //                 fontSize: 25,
              //                 fontWeight: FontWeight.bold,
              //                 color: Colors.black
              //             ),
              //             onChanged: (value){
              //               if(value.length==1){
              //                 FocusScope.of(context).nextFocus();
              //               }
              //             },
              //             textAlign: TextAlign.center,
              //             inputFormatters: [
              //               LengthLimitingTextInputFormatter(1),
              //               FilteringTextInputFormatter.digitsOnly
              //             ],
              //           ),
              //         )
              //     ),
              //     Container(
              //         width: 49,
              //         height: 49,
              //         decoration: BoxDecoration(
              //           color: Colors.white,
              //           borderRadius: BorderRadius.circular(10),
              //         ),
              //         child: Center(
              //           child: TextFormField(
              //             decoration: InputDecoration(hintText: '0'),
              //             onSaved: (pin7){
              //             },
              //
              //             style:  const TextStyle(
              //                 fontSize: 25,
              //                 fontWeight: FontWeight.bold,
              //                 color: Colors.black
              //             ),
              //             onChanged: (value){
              //               if(value.length==1){
              //                 FocusScope.of(context).nextFocus();
              //               }
              //             },
              //             textAlign: TextAlign.center,
              //             inputFormatters: [
              //               LengthLimitingTextInputFormatter(1),
              //               FilteringTextInputFormatter.digitsOnly
              //             ],
              //           ),
              //         )
              //     ),
              //   ],
              // ), ),

              Container(
                child: PinCodeTextField(
                  keyboardType: TextInputType.number,
                  textStyle: TextStyle(
                    color: Colors.white
                  ),
                    appContext: context,
                    length: 6,
                    onChanged: (value){
                      otp=value;
                      print(otp);
                    }),
              ),

              // TextFormField(
              //   onChanged: (value){
              //     otp=value;
              //   },
              //   decoration: InputDecoration(
              //     hintText: 'enter',
              //     hintStyle: TextStyle(
              //       color: Colors.white
              //     )
              //   ),
              // ),

              //confirm button

              const SizedBox(
                height: 94,
              ),
              Center(
                child: CustomButton(
                  title: 'Confirm button',
                  function: ()async{
                    print(email);
                    print(password);
                    print(name);
                    print(otp);
                    response=await signup(email,password,otp,name);
                    if(response != null){
                      //print('wadyyyyy');
                      print(response.toString());
                      Get.to(LoginScreen());
                    }
                    else{
                      print('invaled otp information');
                    }


                  },
                  // function: ()async{
                  //   print('1');
                  //
                  //   response=await signup(email,password,otp,name);
                  //   response[otp];
                  //
                  //   print('2');
                  //   if(response?.data["otp"] == otp){
                  //     print('3');
                  //     print('success');
                  //     signup(email,password,otp,name);
                  //     print('4');
                  //     Get.to(LoginScreen());
                  //   }
                  //   else{
                  //     print('invaled otp ');
                  //   }
                  // },
                ),
              ),





            ],
          ),
        ),
      ),
    );
  }
}
