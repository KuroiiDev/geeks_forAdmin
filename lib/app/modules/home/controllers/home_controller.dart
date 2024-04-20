import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geeks_foradmin/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../data/provider/storage_provider.dart';

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

  logout() async{
    await StorageProvider.write(StorageKey.idUser, "");
    await StorageProvider.write(StorageKey.name, "");
    await StorageProvider.write(StorageKey.status, "");
    Get.offAllNamed(Routes.LOGIN);
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
