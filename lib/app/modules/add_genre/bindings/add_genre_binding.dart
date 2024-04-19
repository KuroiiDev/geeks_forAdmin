import 'package:get/get.dart';

import '../controllers/add_genre_controller.dart';

class AddGenreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddGenreController>(
      () => AddGenreController(),
    );
  }
}
