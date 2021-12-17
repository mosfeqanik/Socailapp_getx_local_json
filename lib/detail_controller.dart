import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsController extends GetxController{
  var fav =0.obs;

  void favCounter(){
    if(fav.value==1){
Get.snackbar("Loved it", "You already Loved it");
    }else{
      fav.value++;
      Get.snackbar("Loved it", "You just Loved it");

    }
  }



}