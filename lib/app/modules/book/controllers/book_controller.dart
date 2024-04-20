import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geeks_foradmin/app/data/provider/storage_provider.dart';
import 'package:get/get.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/model/response_book_get.dart';
import '../../../data/provider/api_provider.dart';
import '../../../routes/app_pages.dart';

class BookController extends GetxController with StateMixin {
  var bookData = Rxn<List<DataBook>>();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getData();
  }

  @override
  void onReady() {
    super.onReady();
    refresh();
  }

  @override
  void onClose() {
    super.onClose();
  }

  routing() {
    if (StorageProvider.read(StorageKey.role) == 'ADMIN') {
      Get.toNamed(Routes.ADD_BOOK);
    } else {
      Get.snackbar("Sorry", "Only For Admin!", backgroundColor: Colors.orange);
    }
  }

  Future<void> getData() async{

    bookData.value = null;
    try {
      final response = await ApiProvider.instance().get(Endpoint.book);
      if (response.statusCode == 200) {
        final ResponseBookGet responseBook = ResponseBookGet.fromJson(response.data);
        if (responseBook.data!.isEmpty){
          log("Empty Data!");
        }else{
          bookData(responseBook.data);
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
