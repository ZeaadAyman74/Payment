import 'package:flutter/material.dart';
import 'package:payment/modules/register/register_screen.dart';
import 'package:payment/shared/network/dio_helper.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:RegisterScreen(),
    );
  }
}
