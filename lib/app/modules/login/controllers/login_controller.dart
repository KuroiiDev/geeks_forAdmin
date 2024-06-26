import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/model/response_login_post.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var isObs = true.obs;

  final count = 0.obs;
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

  login() async {
    try {
      FocusScope.of(Get.context!).unfocus();
      formKey.currentState?.save();
      if (formKey.currentState!.validate()) {
        final response = await ApiProvider.instance().post(Endpoint.login,data: dio.FormData.fromMap({
          "email": emailController.text.toString(),
          "password": passwordController.text.toString()}));
        if (response.statusCode == 200) {
          ResponseLoginPost responseLogin = ResponseLoginPost.fromJson(response.data);
          await StorageProvider.write(StorageKey.idUser, responseLogin.data!.id.toString());
          await StorageProvider.write(StorageKey.name, responseLogin.data!.name.toString());
          await StorageProvider.write(StorageKey.role, responseLogin.data!.role.toString());
          Get.snackbar("Success", "Login Success!", backgroundColor: Colors.green);
          log("Name : ${StorageProvider.read(StorageKey.name)}");
          Get.offAllNamed(Routes.DASHBOARD);
        } else {
          Get.snackbar("Sorry", "Login Failed!", backgroundColor: Colors.orange);
        }
      }
    }on dio.DioException catch(e) {
      if (e.response != null){
        if (e.response?.data != null){
          Get.snackbar("Sorry", "${e.response?.data['message']}", backgroundColor: Colors.orange);
        }
      } else {
        Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
      }
    }
    catch (e) {
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
    }
  }
}
