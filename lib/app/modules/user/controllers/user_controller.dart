import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geeks_foradmin/app/data/model/response_user_get.dart';
import 'package:get/get.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';
import '../../../routes/app_pages.dart';

class UserController extends GetxController with StateMixin {

  var userData = Rxn<List<DataUser>>();

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  routing() {
    if (StorageProvider.read(StorageKey.role) == 'ADMIN') {
      Get.toNamed(Routes.STAFF);
    } else {
      Get.snackbar("Sorry", "Only For Admin!", backgroundColor: Colors.orange);
    }
  }

  Future<void> getData() async{

    userData.value = null;
    try {
      final response = await ApiProvider.instance().get(Endpoint.user);
      if (response.statusCode == 200) {
        final ResponseUserGet responseBook = ResponseUserGet.fromJson(response.data);
        if (responseBook.data!.isEmpty){
          log("Empty Data!");
        }else{
          userData(responseBook.data);
        }
      } else {
        log("Internal Server Error");
      }
    }on DioException catch(e) {
      if (e.response != null){
        if (e.response?.data != null){
          log("${e.response?.data['message']}']");
        }
      } else {
        log(e.message ?? "");
      }
    }catch (e) {
      log(e.toString());
    }
  }
}
