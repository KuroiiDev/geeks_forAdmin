import 'package:get/get.dart';

import '../controllers/add_relation_controller.dart';

class AddRelationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddRelationController>(
      () => AddRelationController(),
    );
  }
}
