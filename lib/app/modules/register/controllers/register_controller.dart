import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../api/services/dealer_service.dart';
import '../../../api/services/file_service.dart';
import '../../../api/services/warranty_service.dart';
import '../../../data/models/warranty_product_model.dart';
import '../../../data/request/warranty_service_request.dart';
import '../../../data/response/dealer_service_response.dart';
import '../../../shared/utils.dart';

class RegisterController extends GetxController {
  final logTitle = "RegisterController";
  Rx<String> filePathCar = ''.obs;
  Rx<XFile> fileUploadCar = XFile('').obs;

  Rx<String> filePathReceive = ''.obs;
  Rx<XFile> fileUploadReceive = XFile('').obs;

  Rx<String> filePathProduct = ''.obs;
  Rx<XFile> fileUploadProduct = XFile('').obs;

  final productType = <String>["wheels", "tire"].obs;
  Rx<String> productTypeSelected = "wheels".obs;

  final tireBrand = <String>[
    "COSMIS",
    "ZESTINO",
  ].obs;
  // Rx<String> productTireSelected = "COSMIS".obs;

  final wheelBrand = <String>[
    "COSMIS",
    "COSMIS2",
    "FATTAH",
    "FORCE",
    "NAYA",
    "UNIVERSE",
    "VALENZA",
  ].obs;
  // Rx<String> productWheelSelected = "COSMIS".obs;
  // final productBrand = <String>[].obs;
  // Rx<String> productBrandSelected = "".obs;

  RxBool isLoading = true.obs;
  RxBool isAddReceive = false.obs;
  RxBool isAddProduct = false.obs;
  RxBool isSavedData = false.obs;

  Rx<String> warrantyId = "".obs;
  Rx<String> warrantyNo = "".obs;
  Rx<String> warrantyDate = "".obs;

  final receiveNo = TextEditingController();
  final productDetail = TextEditingController();
  final productAmount = TextEditingController(text: '0');

  Rx<DealerData> dealerData = DealerData(
    dealerCode: "",
    dealerName: "",
    dealerAddress: "",
    dealerPhone: "",
  ).obs;

  final customerName = TextEditingController();
  final customerPhone = TextEditingController();
  final customerLicensePlate = TextEditingController();
  final customerEmail = TextEditingController();
  final customerMile = TextEditingController();

  final productList = <WarrantyProductModel>[].obs;
  final products = <Products>[];
  final warranty = Warranty();

  String dealerId = "";
  RxInt offset = 0.obs;

  @override
  void onInit() {
    talker.info('$logTitle:onInit:');
    super.onInit();
    dealerId = Get.parameters['dealerId']!;
    getDealer(dealerId);
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

  getDealer(String dealerId) async {
    talker.info('$logTitle:getDealer:$dealerId');
    Map<String, String> qParams = {
      "offset": "0",
      "limit": "10",
      "order": "",
      "dealer_id": dealerId,
    };
    final response = await DealerService().list(qParams);
    for (final item in response!.data!) {
      talker.info('$logTitle:item:${item.dealerCode}');
      dealerData.value.dealerCode = item.dealerCode;
      dealerData.value.dealerName = item.dealerName;
      dealerData.value.dealerAddress = item.dealerAddress;
      dealerData.value.dealerPhone = item.dealerPhone;
      dealerData.value.dealerTax = item.dealerTax;
      dealerData.value.dealerArea = item.dealerArea;
    }
    dealerData.refresh();
  }

  save() async {
    talker.info('$logTitle:save:');
    bool result = true;
    try {
      for (var product in productList) {
        talker.info('$logTitle:save:${product.brand}');
        products.add(Products(
          productType: product.type,
          productBrand: product.brand,
          productAmount: product.amount,
        ));
      }
      warranty.dealerCode = dealerData.value.dealerCode;
      warranty.dealerName = dealerData.value.dealerName;
      warranty.customerName = customerName.text;
      warranty.customerPhone = customerPhone.text;
      warranty.customerLicensePlate = customerLicensePlate.text;
      warranty.customerEmail = customerEmail.text;
      warranty.customerMile = customerMile.text;
      warranty.products = products;

      if (fileUploadCar.value.path.isNotEmpty &&
          fileUploadReceive.value.path.isNotEmpty) {
        final response = await WarrantyService().create(warranty);
        talker.debug('response message : ${response?.message}');
        talker.debug('response message : ${response!.data!.warrantyNo}');
        talker.debug('response message : ${response.data!.warrantyDate}');

        //upload image car
        final bytesCar = await fileUploadCar.value.readAsBytes();
        final sizeCar = await fileUploadCar.value.length();
        if (fileUploadCar.value.name != '') {
          await FileService().create(
            fileUploadCar.value.name,
            sizeCar,
            bytesCar,
            response.data!.warrantyNo,
            'car',
          );
        }

        //upload image receive
        final bytesReceive = await fileUploadReceive.value.readAsBytes();
        final sizeReceive = await fileUploadReceive.value.length();
        if (fileUploadReceive.value.name != '') {
          await FileService().create(
            fileUploadReceive.value.name,
            sizeReceive,
            bytesReceive,
            response.data!.warrantyNo,
            'receive',
          );
        }
        warrantyId.value = response.data!.id!;
        warrantyNo.value = response.data!.warrantyNo!;
        warrantyDate.value = response.data!.warrantyDate!;
        result = true;
      } else {
        result = false;
      }
    } catch (e) {
      talker.error('$e');
      result = false;
    }
    return result;
  }

  addReceive() {
    // receiveNo.text;
    isAddReceive.value = true;
    isAddReceive.refresh();
  }

  addProduct() {
    productList.add(WarrantyProductModel(
      type: productTypeSelected.value,
      // brand: productBrandSelected.value,
      detail: productDetail.text,
      amount: int.parse(productAmount.text),
      imagePath: "",
    ));
    productList.refresh();
    isAddProduct.value = true;
    isAddProduct.refresh();
    productDetail.text = "";
    productAmount.text = "0";
  }
}
