import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:orange_project/view/auth/add_child_view.dart';
import 'package:orange_project/view/auth/login_screen.dart';
import 'package:orange_project/view/auth/otp_screen.dart';
import 'package:orange_project/view/profile_view.dart';
import 'package:orange_project/view/auth/register_screen.dart';
import 'package:orange_project/view/histroy_view.dart';
import 'package:orange_project/view/transfar_view.dart';
import 'package:orange_project/view/bill_view.dart';
import 'package:orange_project/view/home_view.dart';
import 'package:orange_project/view/layout_view.dart';
import 'package:orange_project/view/splash_view.dart';

import 'constant/constant.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch:Colors.deepOrange,
        backgroundColor: Colors.black
      ),
      home: SplashScreen(),
    );
  }
}
