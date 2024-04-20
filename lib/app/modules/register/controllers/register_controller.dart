import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';

class RegisterController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var isObs = true.obs;
  var isAdmin = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void obscurePass(){
    isObs.value = !isObs.value;
    update();
    print(isObs.value);
  }

  register() async{
    try {
      FocusScope.of(Get.context!).unfocus();
      formKey.currentState?.save();
      var link = Endpoint.registerStaff;
      if (isAdmin.value){
        link = Endpoint.registerAdmin;
      }
      if (formKey.currentState!.validate()) {
        final response = await ApiProvider.instance().post(link,data:
        {
          "name": nameController.text.toString(),
          "email": emailController.text.toString(),
          "password": passwordController.text.toString(),
        });
        if (response.statusCode == 201) {
          Get.snackbar("Success", "Account Registered!", backgroundColor: Colors.green);
        } else {
          Get.snackbar("Sorry", "Register Failed!", backgroundColor: Colors.orange);
        }
      }
    }on DioException catch(e) {
      if (e.response != null){
        if (e.response?.data != null){
          Get.snackbar("Sorry", "${e.response?.data['message']}", backgroundColor: Colors.orange);
        }
      } else {
        Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
      }
    }catch (e) {
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
    }
  }
}
