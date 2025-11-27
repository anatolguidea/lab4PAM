import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/constants/colors.dart';
import 'core/di/dependency_injection.dart';
import 'presentation/screens/home_screen.dart';

void main() {
  initDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Recipe App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomeScreen(),
    );
  }
}
