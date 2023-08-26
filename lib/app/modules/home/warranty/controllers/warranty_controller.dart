import 'package:get/get.dart';

import '../../../../data/models/warranty_customer_model.dart';
import '../../../../data/models/warranty_detail_model.dart';
import '../../../../data/response/warranty_customer_service_response.dart';
import '../../../../data/response/warranty_detail_service_response.dart';
import '../../../../shared/utils.dart';

class WarrantyController extends GetxController {
  final logTitle = "WarrantyController";
  RxBool isLoading = true.obs;

  final customerList = <WarrantyCustomerData>[].obs;
  final warrantyList = <WarrantyDetailData>[].obs;

  int selectedIndexFromTable = -1;

  @override
  void onInit() {
    talker.info('$logTitle:onInit:');
    super.onInit();
  }

  @override
  void onReady() {
    talker.info('$logTitle:onReady:');
    super.onReady();
  }

  @override
  void onClose() {
    talker.info('$logTitle:onClose:');
    super.onClose();
  }

  searchData() async {
    talker.info('$logTitle:searchData:');
    customerList.clear();
    isLoading.value =
        await Future.delayed(Duration(seconds: randomValue(1, 3)), () {
      customerList.addAll(listWarrantyCustomer);
      return false;
    });
    customerList.refresh();
    // isLoading.refresh();
  }

  selectDataFromTable(int index, int id) async {
    talker.info('$logTitle:selectDataFromTable:');
    warrantyList.clear();
    isLoading.value =
        await Future.delayed(Duration(seconds: randomValue(1, 3)), () {
      warrantyList.addAll(listWarrantyDetail);
      return false;
    });
    warrantyList.refresh();
    // isLoading.refresh();
  }
}
