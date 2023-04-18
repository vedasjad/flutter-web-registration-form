import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/student.dart';
import '../services/register_services.dart';

class FormController extends GetxController{
  final RegisterService registerService = RegisterService();

  var isLoading = false.obs;

  @override
  void onInit(){
    super.onInit();
  }

  @override
  void onReady(){
    super.onReady();
  }

  @override
  void onClose(){}

  void submitForm(User user, BuildContext context) async{
    isLoading.value = true;
    await registerService.registerUser(
      context: context,
      user: user,
    );
    await Future.delayed(const Duration(seconds: 5));
    isLoading.value = false;
  }
}