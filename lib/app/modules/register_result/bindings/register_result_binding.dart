import 'package:get/get.dart';

import '../controllers/register_result_controller.dart';

class RegisterResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterResultController>(
      () => RegisterResultController(),
    );
  }
}
