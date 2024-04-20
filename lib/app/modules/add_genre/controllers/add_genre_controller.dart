import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geeks_foradmin/app/data/constant/endpoint.dart';
import 'package:get/get.dart';

import '../../../data/provider/api_provider.dart';

class AddGenreController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController genreController = TextEditingController();


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

  addGenre() async{
    try {
      FocusScope.of(Get.context!).unfocus();
      if (formKey.currentState!.validate()) {
        final response = await ApiProvider.instance().post(Endpoint.genre,data:
        {
          "genre": genreController.text.toString(),
        });
        if (response.statusCode == 201) {
          Get.snackbar("Success", "Genre Added!", backgroundColor: Colors.green);
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
