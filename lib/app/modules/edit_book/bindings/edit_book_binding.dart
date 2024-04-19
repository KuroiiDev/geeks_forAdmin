import 'package:get/get.dart';

import '../controllers/edit_book_controller.dart';

class EditBookBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditBookController>(
      () => EditBookController(),
    );
  }
}
