
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class profilecontroller extends GetxController
{
  
  static profilecontroller instance = Get.find();

  RxBool isnameEdit = true.obs;

  togglenameEdit() {
    isnameEdit.toggle();
  }

  RxBool isemailEdit = true.obs;

  toggleemailEdit() {
    isemailEdit.toggle();
  }

  RxBool ismobileEdit = true.obs;

  togglemobileEdit() {
    ismobileEdit.toggle();
  }

  geterrorsnackbar(String message, _){
    Get.snackbar("Error", "$message\n${_.message}",
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.red,
    colorText: Colors.black,
    borderRadius: 10,
    margin: EdgeInsets.only(bottom: 10,left: 10,right: 10));
  }

  getsuccesssnackbar(String message){
    Get.snackbar("Success", message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.green,
    colorText: Colors.black,
    borderRadius: 10,
    margin: EdgeInsets.only(bottom: 10,left: 10,right: 10));
  }

}