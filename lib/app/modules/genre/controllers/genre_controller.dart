import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geeks_foradmin/app/data/model/response_genre_get.dart';
import 'package:get/get.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';
import '../../../routes/app_pages.dart';

class GenreController extends GetxController with StateMixin {
  var genreData = Rxn<List<DataGenre>>();

  final count = 0.obs;
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
      Get.toNamed(Routes.ADD_GENRE);
    } else {
      Get.snackbar("Sorry", "Only For Admin!", backgroundColor: Colors.orange);
    }
  }

  deleteGenre(var id) async {
    if (StorageProvider.read(StorageKey.role) == 'ADMIN') {
      try {
        final response = await ApiProvider.instance().get('${Endpoint.genre}/remove/$id');
        if (response.statusCode == 200) {
          Get.snackbar('Success', 'Deleted Genre Successfully', backgroundColor: Colors.green);
          getData();
        } else {
          log("Internal Server Error");
        }
      }on DioException catch(e) {
        Get.snackbar('Failed', 'Deleted Genre Failure', backgroundColor: Colors.red);
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
    } else {
      Get.snackbar("Sorry", "Only For Admin!", backgroundColor: Colors.orange);
    }
  }

  Future<void> getData() async{

    genreData.value = null;
    try {
      final response = await ApiProvider.instance().get(Endpoint.genre);
      if (response.statusCode == 200) {
        final ResponseGenreGet responseBook = ResponseGenreGet.fromJson(response.data);
        if (responseBook.data!.isEmpty){
          log("Empty Data!");
        }else{
          genreData(responseBook.data);
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
