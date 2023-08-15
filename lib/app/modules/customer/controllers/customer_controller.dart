import 'package:get/get.dart';

class CustomerController extends GetxController {
  final logTitle = "CustomerController";
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    print("onInit");
    var dealerId = Get.parameters["dealerId"];
    print(dealerId);
  }

  @override
  void onReady() {
    super.onReady();
    // var first = Get.parameters["first"];
    // print(first);
    // print("onReady");
  }

  @override
  void onClose() {
    super.onClose();
  }
}
