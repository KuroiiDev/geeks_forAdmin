import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geeks_foradmin/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final TextEditingController idController = TextEditingController();

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

  search() {
    if (idController.text.isNotEmpty) {
      var id = idController.text;
      idController.value = const TextEditingValue(text: '');
      Get.toNamed(Routes.RENT_DETAIL, parameters: {'id' : id});
    } else {
      Get.snackbar('Error', 'Insert Rent Code!', backgroundColor: Colors.red);
    }
  }
}
