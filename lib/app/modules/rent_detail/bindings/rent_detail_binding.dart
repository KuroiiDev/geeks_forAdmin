import 'package:get/get.dart';

import '../controllers/rent_detail_controller.dart';

class RentDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RentDetailController>(
      () => RentDetailController(),
    );
  }
}
