import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:orange_project/view/auth/login_screen.dart';
import 'package:orange_project/view/bill_view.dart';
import 'package:orange_project/view/home_view.dart';
import 'package:orange_project/view/layout_view.dart';
import 'package:orange_project/view/splash_view.dart';


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
      home: SplashScreen(),
    );
  }
}
