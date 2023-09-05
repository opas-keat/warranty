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
              const SizedBox(height: defaultPadding),
              const Divider(),
              CustomerDetail(controller: controller),
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
              Container(
                padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                width: 200,
                child: CustomFlatButton(
                  label: "บันทึก",
                  onPressed: () {},
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
  const CustomerDetail({
    super.key,
    required this.controller,
  });

  final RegisterController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Flexible(
              child: TextFormField(
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
              ),
            ),
          ],
        ),
        Row(
          children: [
            Flexible(
              child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                ],
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
              ),
            ),
            const SizedBox(width: defaultPadding / 2),
            Flexible(
              child: TextFormField(
                keyboardType: TextInputType.text,
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
              ),
            ),
          ],
        ),
        Row(
          children: [
            Flexible(
              flex: 2,
              child: TextFormField(
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
                        text: "email",
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
              ),
            ),
            const SizedBox(width: defaultPadding / 2),
            Flexible(
              child: TextFormField(
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
                    controller.update();
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
                            fit: BoxFit.fitHeight,
                            height: 100,
                            width: 100,
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
                    child: (controller.fileUploadReceive.value.path.isNotEmpty)
                        ? Image.network(
                            controller.fileUploadReceive.value.path,
                            height: 100,
                            width: 100,
                            // fit: BoxFit.fitHeight,
                          )
                        : Image.network(
                            'assets/images/undraw_Add_files_re_v09g.png',
                            fit: BoxFit.fitHeight,
                            height: 100,
                            width: 100,
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: defaultPadding),
        CustomFlatButton(
          label: "เพิ่มรายการสินค้า",
          onPressed: () {
            controller.productList.add(
              WarrantyProductModel(),
            );
          },
        ),
      ],
    );
  }
}

class WarrantyDetail extends StatelessWidget {
  const WarrantyDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blue,
      // height: 100,
      child: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: 'เลชที่ใบรับประกัน',
              ),
              CustomText(
                text: 'วัน-เวลาที่ลงทะเบียน',
              ),
            ],
          ),
          SizedBox(height: defaultPadding * 2),
          Row(
            children: [
              CustomText(
                text: 'ตัวแทนจำหน่าย : ',
              ),
              CustomText(
                text: '[CL1111] บริษัท เอ็นเอส ออโต้วีล จำกัด ',
              ),
            ],
          ),
          SizedBox(height: defaultPadding / 2),
          Row(
            children: [
              CustomText(
                text: 'ที่อยู่ : ',
              ),
              CustomText(
                text:
                    '654/2 ถ.บางบอน 3 แขวงบางบอน เขตบางบอน กรุงเทพมหานคร 10150 ',
              ),
            ],
          ),
        ],
      ),
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
