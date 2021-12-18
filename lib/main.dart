import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/detail_page/detail_page.dart';
import 'views/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: [GetPage(name:'/',page: ()=>SplashPage()),GetPage(name:'/detail',page: ()=>DetailPage())],
    );
  }
}
