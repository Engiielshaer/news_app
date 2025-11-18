import 'package:flutter/material.dart';
import 'package:news_app/splash_screen.dart';
import 'package:news_app/utils/app_theme.dart';

import 'home_screen/home.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      // initialRoute: HomeScreen.routeName,
      theme:MyThemeData.lightTheme,
      routes: {
        HomeScreen.routeName: (_)=>HomeScreen(),
      },

    );
  }
}


