import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/views/detail_page/detail_page_screen/detail_page.dart';
import 'views/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: [GetPage(name:'/',page: ()=>const SplashPage()),GetPage(name:'/detail',page: ()=>const DetailPage())],
    );
  }
}
