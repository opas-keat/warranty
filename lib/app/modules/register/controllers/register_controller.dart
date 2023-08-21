import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/models/warranty_product_model.dart';

class RegisterController extends GetxController {
  Rx<String> filePathCar = ''.obs;
  Rx<XFile> fileUploadCar = XFile('').obs;

  Rx<String> filePathReceive = ''.obs;
  Rx<XFile> fileUploadReceive = XFile('').obs;

  Rx<String> filePathProduct = ''.obs;
  Rx<XFile> fileUploadProduct = XFile('').obs;

  final productType = <String>["wheels", "tires"].obs;
  Rx<String> productTypeSelected = "wheels".obs;

  final productBrand = <String>["COSMIC1", "COSMIC2"].obs;
  Rx<String> productBrandSelected = "COSMIC1".obs;

  RxBool isLoading = true.obs;
  RxBool isAddReceive = false.obs;
  RxBool isAddProduct = false.obs;

  final receiveNo = TextEditingController();
  final productDetail = TextEditingController();
  final productAmount = TextEditingController(text: '0');

  final productList = <WarrantyProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  addReceive() {
    // receiveNo.text;
    isAddReceive.value = true;
    isAddReceive.refresh();
  }

  addProduct() {
    productList.add(WarrantyProductModel(
      id: 1,
      type: productTypeSelected.value,
      brand: productBrandSelected.value,
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
