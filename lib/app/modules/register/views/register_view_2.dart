import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:warranty/app/shared/custom_flat_button.dart';

import '../../../shared/constant.dart';
import '../../../shared/custom_text.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
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
      body: SafeArea(
        child: Container(
          // color: Colors.amber,
          padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding * 2,
          ),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // dealerDetail(),
              // const Divider(),
              // Flexible(
              //   child: TextFormField(
              //     keyboardType: TextInputType.text,
              //     decoration: InputDecoration(
              //       fillColor: Colors.white.withOpacity(.8),
              //       filled: true,
              //       label: Wrap(
              //         direction: Axis.horizontal,
              //         children: [
              //           CustomText(
              //             text: "ชื่อ-นามสกุล",
              //             color: Colors.black87.withOpacity(.9),
              //           ),
              //           CustomText(
              //             text: "*",
              //             color: Colors.red.withOpacity(.9),
              //           ),
              //         ],
              //       ),
              //       labelStyle: const TextStyle(
              //         fontSize: 10,
              //       ),
              //     ),
              //   ),
              // ),
              // Row(
              //   children: [
              //     Flexible(
              //       child: TextFormField(
              //         keyboardType: TextInputType.number,
              //         inputFormatters: <TextInputFormatter>[
              //           FilteringTextInputFormatter.digitsOnly,
              //           LengthLimitingTextInputFormatter(10),
              //         ],
              //         style: const TextStyle(
              //             // fontSize: 24,
              //             ),
              //         decoration: InputDecoration(
              //           fillColor: Colors.white.withOpacity(.8),
              //           filled: true,
              //           label: Wrap(
              //             direction: Axis.horizontal,
              //             children: [
              //               CustomText(
              //                 text: "โทรศัพท์",
              //                 color: Colors.black87.withOpacity(.9),
              //               ),
              //               CustomText(
              //                 text: "*",
              //                 color: Colors.red.withOpacity(.9),
              //               ),
              //             ],
              //           ),
              //           labelStyle: const TextStyle(
              //             fontSize: 10,
              //           ),
              //         ),
              //       ),
              //     ),
              //     const SizedBox(width: defaultPadding / 2),
              //     Flexible(
              //       child: TextFormField(
              //         keyboardType: TextInputType.text,
              //         style: const TextStyle(
              //             // fontSize: 24,
              //             ),
              //         decoration: InputDecoration(
              //           fillColor: Colors.white.withOpacity(.8),
              //           filled: true,
              //           label: Wrap(
              //             direction: Axis.horizontal,
              //             children: [
              //               CustomText(
              //                 text: "ทะเบียนรถ",
              //                 color: Colors.black87.withOpacity(.9),
              //               ),
              //               CustomText(
              //                 text: "*",
              //                 color: Colors.red.withOpacity(.9),
              //               ),
              //             ],
              //           ),
              //           labelStyle: const TextStyle(
              //             fontSize: 10,
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              // Row(
              //   children: [
              //     Flexible(
              //       flex: 2,
              //       child: TextFormField(
              //         keyboardType: TextInputType.emailAddress,
              //         // inputFormatters: <TextInputFormatter>[
              //         //   FilteringTextInputFormatter.digitsOnly,
              //         //   LengthLimitingTextInputFormatter(10),
              //         // ],
              //         style: const TextStyle(
              //             // fontSize: 24,
              //             ),
              //         decoration: InputDecoration(
              //           fillColor: Colors.white.withOpacity(.8),
              //           filled: true,
              //           label: Wrap(
              //             direction: Axis.horizontal,
              //             children: [
              //               CustomText(
              //                 text: "email",
              //                 color: Colors.black87.withOpacity(.9),
              //               ),
              //               CustomText(
              //                 text: "*",
              //                 color: Colors.red.withOpacity(.9),
              //               ),
              //             ],
              //           ),
              //           labelStyle: const TextStyle(
              //             fontSize: 10,
              //           ),
              //         ),
              //       ),
              //     ),
              //     const SizedBox(width: defaultPadding / 2),
              //     Flexible(
              //       child: TextFormField(
              //         keyboardType: TextInputType.number,
              //         inputFormatters: <TextInputFormatter>[
              //           FilteringTextInputFormatter.digitsOnly,
              //           LengthLimitingTextInputFormatter(10),
              //         ],
              //         decoration: InputDecoration(
              //           fillColor: Colors.white.withOpacity(.8),
              //           filled: true,
              //           label: Wrap(
              //             direction: Axis.horizontal,
              //             children: [
              //               CustomText(
              //                 text: "เลขไมล์",
              //                 color: Colors.black87.withOpacity(.9),
              //               ),
              //               CustomText(
              //                 text: "*",
              //                 color: Colors.red.withOpacity(.9),
              //               ),
              //             ],
              //           ),
              //           labelStyle: const TextStyle(
              //             fontSize: 10,
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              // const SizedBox(height: defaultPadding / 2),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Flexible(
              //       // flex: 2,
              //       child: Wrap(
              //         direction: Axis.horizontal,
              //         children: [
              //           CustomText(
              //             text: "รูปรถ",
              //             color: Colors.black87.withOpacity(.9),
              //             scale: 0.9,
              //           ),
              //           CustomText(
              //             text: "*",
              //             scale: 0.9,
              //             color: Colors.red.withOpacity(.9),
              //           ),
              //         ],
              //       ),
              //     ),
              //     const SizedBox(width: defaultPadding / 2),
              //     Flexible(
              //       flex: 2,
              //       child: InkWell(
              //         hoverColor: Colors.white,
              //         onTap: () async {
              //           final ImagePicker picker = ImagePicker();
              //           final XFile? pickedFile = await picker.pickImage(
              //             source: ImageSource.gallery,
              //             maxHeight: 640,
              //             maxWidth: 480,
              //           );
              //           if (pickedFile != null) {
              //             controller.fileUploadCar.value = pickedFile;
              //             controller.update();
              //           }
              //         },
              //         child: Obx(() => SizedBox(
              //               height: 100,
              //               width: 100,
              //               child:
              //                   (controller.fileUploadCar.value.path.isNotEmpty)
              //                       ? Image.network(
              //                           controller.fileUploadCar.value.path,
              //                           height: 100,
              //                           width: 100,
              //                           // fit: BoxFit.fitHeight,
              //                         )
              //                       : Image.network(
              //                           'assets/images/undraw_Add_files_re_v09g.png',
              //                           fit: BoxFit.fitHeight,
              //                           height: 100,
              //                           width: 100,
              //                         ),
              //             )),
              //       ),
              //     ),
              //   ],
              // ),
              // const Divider(),
              // // const SizedBox(height: defaultPadding),
              // Obx(() => controller.isAddReceive.value
              //     ? detailReceive(
              //         controller,
              //       )
              //     : CustomFlatButton(
              //         label: "เพิ่มใบเสร็จ",
              //         onPressed: () {
              //           Get.dialog(
              //             addReceive(controller),
              //             barrierDismissible: false,
              //           );
              //         },
              //       )),
              // // const SizedBox(height: defaultPadding),
              // // const SizedBox(height: defaultPadding),
              // const Divider(),
              // // const SizedBox(height: defaultPadding),
              // Obx(
              //   () => controller.isAddReceive.value
              //       ? CustomFlatButton(
              //           label: "เพิ่มรายการสินค้า",
              //           onPressed: () {
              //             Get.dialog(
              //               addProduct(controller),
              //               barrierDismissible: false,
              //             );
              //           },
              //         )
              //       : Container(),
              // ),
              // // const SizedBox(height: defaultPadding),
              // Obx(
              //   () => Expanded(
              //     child: ListView.builder(
              //       itemCount: controller.productList.length,
              //       itemBuilder: (context, index) {
              //         return ListTile(
              //           dense: true,
              //           title: CustomText(
              //             text:
              //                 "${controller.productList[index].type!} : ${controller.productList[index].brand!} ${controller.productList[index].detail!}",
              //             scale: 0.9,
              //             // scale: 1.2,
              //           ),
              //           trailing: CustomText(
              //             text:
              //                 "จำนวน : ${controller.productList[index].amount!}",
              //             scale: 0.9,
              //             // scale: 1.2,
              //           ),
              //         );
              //       },
              //     ),
              //   ),
              // ),
              // // detailProduct(controller)
              // // Expanded(
              // //   flex: 1,
              // //   child: Container(),
              // // ),
            ],
          ),
        ),
      ),
    );
  }

  Padding dealerDetail() {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Wrap(
        runSpacing: defaultPadding,
        children: [
          Row(
            children: [
              Container(
                alignment: Alignment.centerRight,
                // color: Colors.amber,
                width: 150,
                child: const Padding(
                  padding: EdgeInsets.only(right: defaultPadding),
                  child: CustomText(
                    text: "รหัสร้านค้า : ",
                    scale: 0.9,
                  ),
                ),
              ),
              const CustomText(
                text: "AA168",
                scale: 0.9,
              ),
            ],
          ),
          Row(
            children: [
              Container(
                alignment: Alignment.centerRight,
                // color: Colors.amber,
                width: 150,
                child: const Padding(
                  padding: EdgeInsets.only(right: defaultPadding),
                  child: CustomText(
                    text: "ชื่อร้านค้า : ",
                    scale: 0.9,
                  ),
                ),
              ),
              const CustomText(
                text: "8/168 กรุงเทพ",
                scale: 0.9,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget addReceive(
    RegisterController controller,
  ) {
    return AlertDialog(
      title: CustomText(
        text: "ใบเสร็จ",
        color: Colors.black87.withOpacity(.9),
      ),
      content: SizedBox(
        // color: Colors.amber,
        // padding: const EdgeInsets.symmetric(vertical: defaultPadding * 4),
        width: 480,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Wrap(
              direction: Axis.horizontal,
              children: [
                CustomText(
                  text: "เลขที่ใบเสร็จ",
                  color: Colors.black87.withOpacity(.9),
                ),
                CustomText(
                  text: "*",
                  color: Colors.red.withOpacity(.9),
                ),
              ],
            ),
            const SizedBox(height: defaultPadding / 2),
            TextFormField(
              controller: controller.receiveNo,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                fillColor: Colors.white.withOpacity(.8),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultPadding / 2),
                  borderSide: const BorderSide(color: Colors.black54, width: 1),
                ),
                isCollapsed: true,
                contentPadding: const EdgeInsets.fromLTRB(12, 14, 12, 12),
              ),
            ),
            const SizedBox(height: defaultPadding),
            Wrap(
              direction: Axis.horizontal,
              children: [
                CustomText(
                  text: "รูปใบเสร็จ",
                  color: Colors.black87.withOpacity(.9),
                ),
                CustomText(
                  text: "*",
                  color: Colors.red.withOpacity(.9),
                ),
              ],
            ),
            const SizedBox(height: defaultPadding / 2),
            InkWell(
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
                  child: (controller.fileUploadReceive.value.path.isNotEmpty)
                      ? Image.network(
                          controller.fileUploadReceive.value.path,
                          height: 100,
                          fit: BoxFit.fitHeight,
                        )
                      : Image.network(
                          'assets/images/undraw_Add_files_re_v09g.png',
                          fit: BoxFit.fitHeight,
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: const Text("บันทึก"),
          onPressed: () {
            controller.addReceive();
            Get.back();
          },
        ),
        TextButton(
          child: const Text("ปิด"),
          onPressed: () => Get.back(),
        ),
      ],
    );
  }
}

Widget addProduct(
  RegisterController controller,
) {
  return AlertDialog(
    title: CustomText(
      text: "สินค้า",
      color: Colors.black87.withOpacity(.9),
    ),
    content: SizedBox(
      // color: Colors.amber,
      // padding: const EdgeInsets.symmetric(vertical: defaultPadding * 4),
      width: 480,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Wrap(
            direction: Axis.horizontal,
            children: [
              CustomText(
                text: "ประเภทสินค้า",
                color: Colors.black87.withOpacity(.9),
              ),
              CustomText(
                text: "*",
                color: Colors.red.withOpacity(.9),
              ),
            ],
          ),
          const SizedBox(height: defaultPadding / 2),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              fillColor: Colors.white.withOpacity(.8),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(defaultPadding / 2),
                borderSide: const BorderSide(color: Colors.black54, width: 1),
              ),
              isCollapsed: true,
              contentPadding: const EdgeInsets.fromLTRB(12, 14, 12, 12),
            ),
            value: controller.productTypeSelected.value,
            onChanged: (newValue) {
              controller.productTypeSelected.value = newValue!;
            },
            items: controller.productType.obs.value.map((item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  textScaleFactor: 0.9,
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: defaultPadding),
          Wrap(
            direction: Axis.horizontal,
            children: [
              CustomText(
                text: "ยี่ห้อ",
                color: Colors.black87.withOpacity(.9),
              ),
              CustomText(
                text: "*",
                color: Colors.red.withOpacity(.9),
              ),
            ],
          ),
          const SizedBox(height: defaultPadding / 2),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              fillColor: Colors.white.withOpacity(.8),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(defaultPadding / 2),
                borderSide: const BorderSide(color: Colors.black54, width: 1),
              ),
              isCollapsed: true,
              contentPadding: const EdgeInsets.fromLTRB(12, 14, 12, 12),
            ),
            value: controller.productBrandSelected.value,
            onChanged: (newValue) {
              controller.productBrandSelected.value = newValue!;
            },
            items: controller.productBrand.obs.value.map((item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  textScaleFactor: 0.9,
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: defaultPadding),
          Wrap(
            direction: Axis.horizontal,
            children: [
              CustomText(
                text: "รายละเอียด",
                color: Colors.black87.withOpacity(.9),
              ),
              CustomText(
                text: "*",
                color: Colors.red.withOpacity(.9),
              ),
            ],
          ),
          const SizedBox(height: defaultPadding / 2),
          TextFormField(
            controller: controller.productDetail,
            keyboardType: TextInputType.text,
            maxLines: 3,
            decoration: InputDecoration(
              fillColor: Colors.white.withOpacity(.8),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(defaultPadding / 2),
                borderSide: const BorderSide(color: Colors.black54, width: 1),
              ),
              isCollapsed: true,
              contentPadding: const EdgeInsets.fromLTRB(12, 14, 12, 12),
            ),
          ),
          const SizedBox(height: defaultPadding),
          Wrap(
            direction: Axis.horizontal,
            children: [
              CustomText(
                text: "จำนวน",
                color: Colors.black87.withOpacity(.9),
              ),
              CustomText(
                text: "*",
                color: Colors.red.withOpacity(.9),
              ),
            ],
          ),
          const SizedBox(height: defaultPadding / 2),
          TextFormField(
            controller: controller.productAmount,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(10),
            ],
            decoration: InputDecoration(
              fillColor: Colors.white.withOpacity(.8),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(defaultPadding / 2),
                borderSide: const BorderSide(color: Colors.black54, width: 1),
              ),
              isCollapsed: true,
              contentPadding: const EdgeInsets.fromLTRB(12, 14, 12, 12),
            ),
          ),
          const SizedBox(height: defaultPadding),
          Wrap(
            direction: Axis.horizontal,
            children: [
              CustomText(
                text: "รูปสินค้า",
                color: Colors.black87.withOpacity(.9),
              ),
              CustomText(
                text: "*",
                color: Colors.red.withOpacity(.9),
              ),
            ],
          ),
          const SizedBox(height: defaultPadding / 2),
          InkWell(
            hoverColor: Colors.white,
            onTap: () async {
              final ImagePicker picker = ImagePicker();
              final XFile? pickedFile = await picker.pickImage(
                source: ImageSource.gallery,
                maxHeight: 640,
                maxWidth: 480,
              );
              if (pickedFile != null) {
                controller.fileUploadProduct.value = pickedFile;
                controller.update();
              }
            },
            child: Obx(
              () => SizedBox(
                height: 100,
                child: (controller.fileUploadProduct.value.path.isNotEmpty)
                    ? Image.network(
                        controller.fileUploadProduct.value.path,
                        height: 100,
                        fit: BoxFit.fitHeight,
                      )
                    : Image.network(
                        'assets/images/undraw_Add_files_re_v09g.png',
                        fit: BoxFit.fitHeight,
                      ),
              ),
            ),
          ),
        ],
      ),
    ),
    actions: [
      TextButton(
        child: const Text("บันทึก"),
        onPressed: () {
          controller.addProduct();
          Get.back();
        },
      ),
      TextButton(
        child: const Text("ปิด"),
        onPressed: () => Get.back(),
      ),
    ],
  );
}

Widget detailReceive(
  RegisterController controller,
) {
  return Padding(
    padding: const EdgeInsets.all(defaultPadding),
    child: Wrap(
      runSpacing: defaultPadding,
      children: [
        Row(
          children: [
            Container(
              alignment: Alignment.centerRight,
              // color: Colors.amber,
              width: 150,
              child: const Padding(
                padding: EdgeInsets.only(right: defaultPadding),
                child: CustomText(
                  text: "เลขที่ใบเสร็จ : ",
                ),
              ),
            ),
            CustomText(
              text: controller.receiveNo.text,
            ),
          ],
        ),
        Row(
          children: [
            const SizedBox(height: defaultPadding / 2),
            InkWell(
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
                  width: 240,
                  child: (controller.fileUploadReceive.value.path.isNotEmpty)
                      ? Image.network(
                          controller.fileUploadReceive.value.path,
                          height: 100,
                          width: 240,
                          // fit: BoxFit.fitWidth,
                        )
                      : Image.network(
                          'assets/images/undraw_Add_files_re_v09g.png',
                          // fit: BoxFit.fitWidth,
                        ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget detailProduct(
  RegisterController controller,
) {
  return Expanded(
    child: ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return Card(
            // color: Colors.white38.withOpacity(0.9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shadowColor: Colors.black87,
            elevation: 8,
            // color: Colors.white38.withOpacity(0.9),
            borderOnForeground: true,
            margin: const EdgeInsets.all(defaultPadding),
            child: const Column(
              children: [
                CustomText(
                  text:
                      "1. ล้อแม็ก : Cosmic DEVIL-M8(YA9987) 16X9.0 6X139.7 ET0 CB.106 BLK-W-(R)Z (สีดำ+CNCข้างก้าน+ตัวหนังสือแดง) ",
                  scale: 1.5,
                ),
                CustomText(
                  text: "จำนวน : 4",
                  scale: 1.5,
                ),
                SizedBox(height: defaultPadding),
              ],
            ));
      },
    ),
  );
}
