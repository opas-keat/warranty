import 'package:get/get.dart';

import '../../../api/services/warranty_service.dart';
import '../../../data/response/warranty_service_response.dart';
import '../../../shared/utils.dart';

class RegisterResultController extends GetxController {
  final logTitle = "RegisterResultController";

  String warrantyId = "";

  Rx<WarrantyData> warrantyData = WarrantyData(
    customerEmail: "",
    customerLicensePlate: "",
    customerMile: "",
    customerName: "",
    customerPhone: "",
    dealerCode: "",
    dealerName: "",
    warrantyDate: "",
    warrantyNo: "",
    products: [],
  ).obs;

  @override
  void onInit() {
    talker.info('$logTitle:onInit:');
    super.onInit();
    warrantyId = Get.parameters['warrantyId']!;
    getWarranty(warrantyId);
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

  getWarranty(String warrantyId) async {
    talker.info('$logTitle:getWarranty:$warrantyId');
    final response = await WarrantyService().getById(warrantyId);
    if (response!.code! == "000") {
      talker.info('$logTitle:warrantyNo:${response.data!.warrantyNo}');
      warrantyData.value.warrantyNo = response.data!.warrantyNo;
      warrantyData.value.warrantyDate = response.data!.warrantyDate;
      warrantyData.value.dealerName = response.data!.dealerName;
      warrantyData.value.customerName = response.data!.customerName;
      warrantyData.value.customerPhone = response.data!.customerPhone;
      warrantyData.value.customerEmail = response.data!.customerEmail;
      warrantyData.value.customerLicensePlate =
          response.data!.customerLicensePlate;
      warrantyData.value.customerMile = response.data!.customerMile;
      for (final product in response.data!.products!) {
        warrantyData.value.products!.add(
          Products(
            productType: product.productType,
            productBrand: product.productBrand,
            productAmount: product.productAmount,
            productColorExpire: product.productColorExpire,
            productMileExpire: product.productMileExpire,
            productPromotionExpire: product.productPromotionExpire,
            productStructureExpire: product.productStructureExpire,
            productTireExpire: product.productTireExpire,
          ),
        );
      }
    }
    warrantyData.refresh();
  }
}
