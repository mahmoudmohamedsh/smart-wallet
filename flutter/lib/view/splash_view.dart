import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:orange_project/view/auth/login_screen.dart';

import '../constant/constant.dart';
class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 4),
        ()=>Get.to(LoginScreen()),
    );
    return Scaffold(
      body:Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset('assets/images/Splash1.png',fit: BoxFit.cover,),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                Container(
                  width: 46,
                  height: 49,
                  decoration: BoxDecoration(
                      color: secondColor,
                      borderRadius: BorderRadius.circular(14)
                  ),

                  child:  const Center(
                    child: Text('T',style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),),
                  ),
                ),
                const SizedBox(
                  width: 0,
                ),
                const Text('ap Cash',style: TextStyle(
                    color: Colors.white,
                    fontSize: 30
                ),),
              ],
            ),
          ),
        ],

      ),
    );
  }
}
