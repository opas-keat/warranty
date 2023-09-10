import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/models/warranty_product_model.dart';
import '../../../shared/constant.dart';
import '../../../shared/custom_flat_button.dart';
import '../../../shared/custom_text.dart';
import '../controllers/register_controller.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final RegisterController controller = Get.put(RegisterController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: "ลงทะเบียนรับประกัน",
          color: Colors.white,
          scale: 0.9,
        ),
        centerTitle: true,
        actions: null,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: <Widget>[
              const WarrantyDetail(),
              // const SizedBox(height: defaultPadding / 2),
              const Divider(),
              CustomerDetail(),
              Expanded(
                child: SingleChildScrollView(
                  child: Obx(
                    () => ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.productList.length,
                      itemBuilder: (context, index) {
                        return ProductList(controller: controller);
                      },
                    ),
                  ),
                ),
              ),
              Obx(
                () => controller.isSavedData.value
                    ? Container()
                    : Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: defaultPadding),
                        width: 100,
                        child: CustomFlatButton(
                          label: "บันทึก",
                          onPressed: () async {
                            Get.dialog(
                              const Center(
                                child: CircularProgressIndicator(),
                              ),
                              barrierDismissible: false,
                            );
                            final result = await controller.save();
                            Get.back();
                            if (result) {
                              controller.isSavedData.value = true;
                              Get.dialog(
                                SizedBox(
                                  height: 300,
                                  child: AlertDialog(
                                    // title: const Text('เพิ่มร้านค้า'),
                                    content: const CustomText(
                                      text:
                                          "กรุณา capture หน้าจอเก็บไว้ หลังจากกด ปิด",
                                    ),
                                    actions: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextButton(
                                            child: const CustomText(
                                              text: "ปิด",
                                              color: Colors.blue,
                                              weight: FontWeight.bold,
                                              scale: 1.2,
                                            ),
                                            onPressed: () {
                                              Get.back();
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                barrierDismissible: false,
                              );
                            }
                          },
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomerDetail extends StatelessWidget {
  CustomerDetail({
    super.key,
  });

  final _formKeyCustomer = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final RegisterController controller = Get.find<RegisterController>();
    return Form(
      key: _formKeyCustomer,
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                child: TextFormField(
                  controller: controller.customerName,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    fillColor: Colors.white.withOpacity(.8),
                    filled: true,
                    label: Wrap(
                      direction: Axis.horizontal,
                      children: [
                        CustomText(
                          text: "ชื่อ-นามสกุล",
                          color: Colors.black87.withOpacity(.9),
                        ),
                        CustomText(
                          text: "*",
                          color: Colors.red.withOpacity(.9),
                        ),
                      ],
                    ),
                    labelStyle: const TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอก ชื่อ-นามสกุล';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              Flexible(
                child: TextFormField(
                  controller: controller.customerPhone,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                  decoration: InputDecoration(
                    fillColor: Colors.white.withOpacity(.8),
                    filled: true,
                    label: Wrap(
                      direction: Axis.horizontal,
                      children: [
                        CustomText(
                          text: "โทรศัพท์",
                          color: Colors.black87.withOpacity(.9),
                        ),
                        CustomText(
                          text: "*",
                          color: Colors.red.withOpacity(.9),
                        ),
                      ],
                    ),
                    labelStyle: const TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอก โทรศัพท์';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(width: defaultPadding / 2),
              Flexible(
                child: TextFormField(
                  controller: controller.customerLicensePlate,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    fillColor: Colors.white.withOpacity(.8),
                    filled: true,
                    label: Wrap(
                      direction: Axis.horizontal,
                      children: [
                        CustomText(
                          text: "ทะเบียนรถ",
                          color: Colors.black87.withOpacity(.9),
                        ),
                        CustomText(
                          text: "*",
                          color: Colors.red.withOpacity(.9),
                        ),
                      ],
                    ),
                    labelStyle: const TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอก ทะเบียนรถ';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              Flexible(
                flex: 2,
                child: TextFormField(
                  controller: controller.customerEmail,
                  keyboardType: TextInputType.emailAddress,
                  // inputFormatters: <TextInputFormatter>[
                  //   FilteringTextInputFormatter.digitsOnly,
                  //   LengthLimitingTextInputFormatter(10),
                  // ],
                  style: const TextStyle(
                      // fontSize: 24,
                      ),
                  decoration: InputDecoration(
                    fillColor: Colors.white.withOpacity(.8),
                    filled: true,
                    label: Wrap(
                      direction: Axis.horizontal,
                      children: [
                        CustomText(
                          text: "Email",
                          color: Colors.black87.withOpacity(.9),
                        ),
                        CustomText(
                          text: "*",
                          color: Colors.red.withOpacity(.9),
                        ),
                      ],
                    ),
                    labelStyle: const TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอก Email';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(width: defaultPadding / 2),
              Flexible(
                child: TextFormField(
                  controller: controller.customerMile,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                  decoration: InputDecoration(
                    fillColor: Colors.white.withOpacity(.8),
                    filled: true,
                    label: Wrap(
                      direction: Axis.horizontal,
                      children: [
                        CustomText(
                          text: "เลขไมล์",
                          color: Colors.black87.withOpacity(.9),
                        ),
                        CustomText(
                          text: "*",
                          color: Colors.red.withOpacity(.9),
                        ),
                      ],
                    ),
                    labelStyle: const TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอก เลขไมล์';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: defaultPadding / 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: Wrap(
                  direction: Axis.horizontal,
                  children: [
                    CustomText(
                      text: "รูปรถ",
                      color: Colors.black87.withOpacity(.9),
                      scale: 0.9,
                    ),
                    CustomText(
                      text: "*",
                      scale: 0.9,
                      color: Colors.red.withOpacity(.9),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: InkWell(
                  hoverColor: Colors.white,
                  onTap: () async {
                    final ImagePicker picker = ImagePicker();
                    final XFile? pickedFile = await picker.pickImage(
                      source: ImageSource.gallery,
                      maxHeight: 640,
                      maxWidth: 480,
                    );
                    if (pickedFile != null) {
                      controller.fileUploadCar.value = pickedFile;
                      controller.fileUploadReceive.refresh();
                    }
                  },
                  child: Obx(
                    () => SizedBox(
                      height: 100,
                      width: 100,
                      child: (controller.fileUploadCar.value.path.isNotEmpty)
                          ? Image.network(
                              controller.fileUploadCar.value.path,
                              height: 100,
                              width: 100,
                              // fit: BoxFit.fitHeight,
                            )
                          : Image.network(
                              'assets/images/undraw_Add_files_re_v09g.png',
                              fit: BoxFit.fitWidth,
                            ),
                    ),
                  ),
                ),
              ),
              Flexible(child: Container()),
              Flexible(
                child: Wrap(
                  direction: Axis.horizontal,
                  children: [
                    CustomText(
                      text: "รูปใบเสร็จ",
                      color: Colors.black87.withOpacity(.9),
                      scale: 0.9,
                    ),
                    CustomText(
                      text: "*",
                      scale: 0.9,
                      color: Colors.red.withOpacity(.9),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: InkWell(
                  hoverColor: Colors.white,
                  onTap: () async {
                    final ImagePicker picker = ImagePicker();
                    final XFile? pickedFile = await picker.pickImage(
                      source: ImageSource.gallery,
                      maxHeight: 640,
                      maxWidth: 480,
                    );
                    if (pickedFile != null) {
                      controller.fileUploadReceive.value = pickedFile;
                      controller.update();
                    }
                  },
                  child: Obx(
                    () => SizedBox(
                      height: 100,
                      width: 100,
                      child:
                          (controller.fileUploadReceive.value.path.isNotEmpty)
                              ? Image.network(
                                  controller.fileUploadReceive.value.path,
                                  height: 100,
                                  width: 100,
                                  // fit: BoxFit.fitHeight,
                                )
                              : Image.network(
                                  'assets/images/undraw_Add_files_re_v09g.png',
                                  fit: BoxFit.fitWidth,
                                ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // const SizedBox(height: defaultPadding),
          CustomFlatButton(
            label: "เพิ่มรายการสินค้า",
            onPressed: () {
              final isValid = _formKeyCustomer.currentState!.validate();
              if (isValid) {
                controller.productList.add(
                  WarrantyProductModel(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class WarrantyDetail extends StatelessWidget {
  const WarrantyDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final RegisterController controller = Get.find<RegisterController>();
    return Container(
      // color: Colors.blue,
      // height: 100,
      child: Obx(() => Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'เลชที่ใบรับประกัน : ${controller.warrantyNo.value}',
                    // weight: FontWeight.bold,
                    scale: 0.8,
                  ),
                  CustomText(
                    // text:
                    //     'วัน-เวลาที่ลงทะเบียน : ${controller.warrantyDate.value}',
                    // weight: FontWeight.bold,
                    text: controller.warrantyDate.value,
                    scale: 0.8,
                  ),
                ],
              ),
              const SizedBox(height: defaultPadding / 2),
              Row(
                children: [
                  const CustomText(
                    text: 'ตัวแทนจำหน่าย : ',
                    scale: 0.8,
                  ),
                  Expanded(
                    child: CustomText(
                      text:
                          '${controller.dealerData.value.dealerCode!} ${controller.dealerData.value.dealerName}',
                      scale: 0.8,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: defaultPadding / 2),
              Row(
                children: [
                  const CustomText(
                    text: 'ที่อยู่ : ',
                    scale: 0.8,
                  ),
                  Expanded(
                    child: CustomText(
                      text: controller.dealerData.value.dealerAddress!,
                      scale: 0.8,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: defaultPadding / 2),
              Row(
                children: [
                  const CustomText(
                    text: 'โทรศัพท์ : ',
                    scale: 0.8,
                  ),
                  CustomText(
                    text: controller.dealerData.value.dealerPhone!,
                    scale: 0.8,
                  ),
                ],
              ),
            ],
          )),
    );
  }
}

class ProductList extends StatelessWidget {
  const ProductList({
    super.key,
    required this.controller,
  });

  final RegisterController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Row(
        children: [
          Flexible(
            flex: 2,
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                fillColor: Colors.white.withOpacity(.8),
                filled: true,
                isCollapsed: false,
                isDense: true,
                contentPadding: const EdgeInsets.fromLTRB(12, 14, 12, 12),
              ),
              value: controller.productTypeSelected.value,
              onChanged: (newValue) {
                controller.productTypeSelected.value = newValue!;
              },
              items: controller.productType.obs.value.map((item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: CustomText(
                    text: item,
                    color: Colors.black87.withOpacity(.9),
                    scale: 1.0,
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(width: defaultPadding / 2),
          Flexible(
            flex: 6,
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                fillColor: Colors.white.withOpacity(.8),
                filled: true,
                isCollapsed: false,
                isDense: true,
                contentPadding: const EdgeInsets.fromLTRB(12, 14, 12, 12),
              ),
              value: controller.productBrandSelected.value,
              onChanged: (newValue) {
                controller.productBrandSelected.value = newValue!;
              },
              items: controller.productBrand.obs.value.map((item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: CustomText(
                    text: item,
                    color: Colors.black87.withOpacity(.9),
                    scale: 1.0,
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(width: defaultPadding / 2),
          Flexible(
            flex: 2,
            child: TextFormField(
              controller: controller.productAmount,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10),
              ],
              decoration: InputDecoration(
                fillColor: Colors.white.withOpacity(.8),
                filled: true,
                isDense: true,
                label: CustomText(
                  text: "จำนวน",
                  color: Colors.black87.withOpacity(.9),
                  scale: 1.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
