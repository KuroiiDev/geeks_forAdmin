import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:geeks_foradmin/app/modules/book/controllers/book_controller.dart';
import 'package:geeks_foradmin/app/modules/genre/controllers/genre_controller.dart';
import 'package:geeks_foradmin/app/modules/rent/controllers/rent_controller.dart';
import 'package:geeks_foradmin/app/modules/user/controllers/user_controller.dart';
import 'package:get/get.dart';

import '../../../data/provider/storage_provider.dart';
import '../../../routes/app_pages.dart';
import '../../home/controllers/home_controller.dart';

class DashboardController extends GetxController {
  final Rx<PageController> pageController = Rx<PageController>(PageController(initialPage: 0));
  HomeController homeController = Get.put(HomeController(), permanent: true);
  BookController bookController = Get.put(BookController(), permanent: true);
  GenreController genreController = Get.put(GenreController(), permanent: true);
  UserController userController = Get.put(UserController(), permanent: true);
  RentController rentController = Get.put(RentController(), permanent: true);
  var tabIndex = 0.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    super.onReady();
    String status = StorageProvider.read(StorageKey.status);
    log("status : $status");
    if (status != "logged"){
      //Get.offAllNamed(Routes.LOGIN);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeTabIndex(int index) {
    pageController.value.animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
    update();
  }
}
