import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/test_model.dart';

class TestController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool firstTime = true.obs;
  TestUserModel? userData;

  void fetchUser() async {
    try{
      firstTime(false);
      isLoading(true);
      var response = await http.get(Uri.parse('https://random-data-api.com/api/v2/users'));
      if (response.statusCode == 200) {
        var userInfo = testUserModelFromJson(response.body);
        userData = userInfo;
        isLoading(false);
        print('Fetched data :${userData!.username}');
      }else{
        Get.snackbar('Warning!', 'Your have no order to upload',
            backgroundColor: Colors.red,
            colorText: Colors.white,
            duration: const Duration(seconds: 1));
        isLoading(false);
      }
    }catch(e){
      Get.snackbar('Error!', 'There is an error occurred please try again',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: const Duration(seconds: 1));
      print('Fetching failed due to: $e');
      isLoading(false);
    }
  }

  void resetAll(){
    firstTime.value = true;
    isLoading.value = false;
  }
}