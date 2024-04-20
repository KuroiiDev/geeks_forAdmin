import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/model/response_genre_get.dart';
import '../../../data/provider/api_provider.dart';

class AddRelationController extends GetxController with StateMixin{

  var genreData = Rxn<List<DataGenre>>();
  var bookId = '0';

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

  link(var idGenre) async {
    bookId = Get.parameters['id'].toString();
    try {
      final response = await ApiProvider.instance().post('${Endpoint.genre}/link',data: dio.FormData.fromMap({
        "book_id": bookId,
        "genre_id": idGenre}));
      if (response.statusCode == 201) {
        Get.snackbar("Success", "Link Success!", backgroundColor: Colors.green);
      } else if (response.statusCode == 203){
        Get.snackbar("Warning", "Already Linked", backgroundColor: Colors.orange);
      } else {
        Get.snackbar("Sorry", "Link Failed!", backgroundColor: Colors.orange);
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
