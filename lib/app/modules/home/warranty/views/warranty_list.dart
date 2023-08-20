import 'package:flutter/material.dart';

import '../../../../shared/constant.dart';
import '../../../../shared/custom_text.dart';
import '../../../../shared/header.dart';
import '../../../../shared/utils.dart';

class WarrantyList extends StatelessWidget {
  const WarrantyList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
          const Header(moduleName: "การรับประกัน"),
          const SizedBox(height: defaultPadding),
          Row(
            children: [
              // const Spacer(flex: 2),
              WarrantySearchWidget(),
              // const Spacer(flex: 2),
            ],
          ),
          const SizedBox(height: defaultPadding),
          const Row(
            children: [
              CustomText(
                text: "รายละเอียดลูกค้า",
                weight: FontWeight.bold,
                scale: 1.8,
              ),
            ],
          ),
          accentDividerTop,
          customerDetail(),
          const SizedBox(height: defaultPadding),
          const Row(
            children: [
              CustomText(
                text: "รายการรับประกัน",
                weight: FontWeight.bold,
                scale: 1.8,
              ),
            ],
          ),
          accentDividerTop,
          Expanded(
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
                    child: Column(
                      children: [
                        Container(
                          color: Colors.lightBlue.shade100.withOpacity(0.5),
                          child: ListTile(
                            dense: true,
                            title: Padding(
                              padding: const EdgeInsets.all(defaultPadding / 2),
                              child: Wrap(
                                alignment: WrapAlignment.spaceBetween,
                                spacing: defaultPadding / 2,
                                children: [
                                  Wrap(
                                    children: [
                                      CustomText(
                                        text:
                                            "เลขที่ใบเสร็จ : ${randomValue(100, 1000)}",
                                        scale: 2.0,
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.image_sharp,
                                        ),
                                        color: primaryColor,
                                      ),
                                    ],
                                  ),
                                  const CustomText(
                                    text: "วันที่ซื้อสินค้า : 08/08/2023",
                                    scale: 1.8,
                                  ),
                                ],
                              ),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(
                                // top: defaultPadding / 2,
                                right: defaultPadding / 2,
                                bottom: defaultPadding / 2,
                              ),
                              child: Wrap(
                                alignment: WrapAlignment.end,
                                spacing: defaultPadding / 2,
                                children: [
                                  CustomText(
                                    text:
                                        "รหัสร้านค้า : ${randomValue(100, 1000)}",
                                    scale: 1.3,
                                  ),
                                  const CustomText(
                                    text:
                                        "ชื่อร้านค้า : PPSUPERWHEEL SUPER STORE.",
                                    scale: 1.3,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // const Divider(),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: defaultPadding / 2),
                          child: CustomText(
                            text: "รายการสินค้า",
                            scale: 1.5,
                          ),
                        ),
                        // const Divider(),
                        Container(
                          // color: Colors.black38,
                          // width: double.infinity,
                          // padding: const EdgeInsets.symmetric(
                          //   // horizontal: defaultPadding * 4,
                          //   vertical: defaultPadding,
                          // ),
                          child: const Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: defaultPadding / 2,
                                  horizontal: defaultPadding,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text:
                                          "1. ล้อแม็ก : Cosmic DEVIL-M8(YA9987) 16X9.0 6X139.7 ET0 CB.106 BLK-W-(R)Z  (สีดำ+CNCข้างก้าน+ตัวหนังสือแดง) ",
                                      scale: 1.5,
                                    ),
                                    CustomText(
                                      text: "จำนวน : 4",
                                      scale: 1.5,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: defaultPadding,
                                  horizontal: defaultPadding,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: "2. ล้อแม็ก : Cosmic ขนาด 19 นิ้ว",
                                      scale: 1.5,
                                    ),
                                    CustomText(
                                      text: "จำนวน : 4",
                                      scale: 1.5,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: defaultPadding,
                                  horizontal: defaultPadding,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text:
                                          "3. ยาง : AUSTONE 215-55-17 (D2) ปี 2020",
                                      scale: 1.5,
                                    ),
                                    CustomText(
                                      text: "จำนวน : 4",
                                      scale: 1.5,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: defaultPadding),
                      ],
                    ));
                // return Padding(
                //   padding: const EdgeInsets.symmetric(
                //     horizontal: defaultPadding,
                //     vertical: defaultPadding / 2,
                //   ),
                //   child: Container(
                //     // height: 200,
                //     padding: const EdgeInsets.all(
                //       defaultPadding,
                //     ),
                //     color: Colors.amber,
                //     child: ListTile(
                //       dense: true,
                //       title: Wrap(
                //         alignment: WrapAlignment.spaceBetween,
                //         spacing: defaultPadding / 2,
                //         children: [
                //           CustomText(
                //             text: "เลขที่ใบเสร็จ : ${randomValue(100, 1000)}",
                //             scale: 1.5,
                //           ),
                //           const CustomText(
                //             text: "วันที่ซื้อสินค้า : 08/08/2023",
                //             scale: 1.5,
                //           ),
                //         ],
                //       ),
                //       subtitle: Wrap(
                //         alignment: WrapAlignment.end,
                //         spacing: defaultPadding / 2,
                //         children: [
                //           CustomText(
                //             text: "รหัสร้านค้า : ${randomValue(100, 1000)}",
                //             scale: 1.5,
                //           ),
                //           const CustomText(
                //             text: "ชื่อร้านค้า : PPSUPERWHEEL SUPER STORE.",
                //             scale: 1.5,
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // );
              },
            ),
          ),
        ],
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
                    scale: 1.3,
                  ),
                ),
              ),
              const CustomText(
                text: "AA168",
                scale: 1.3,
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
                    scale: 1.3,
                  ),
                ),
              ),
              const CustomText(
                text: "8/168 กรุงเทพ",
                scale: 1.3,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Padding customerDetail() {
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
                  text: "ชื่อ-นามสกุล : ",
                  scale: 1.5,
                ),
              ),
            ),
            const CustomText(
              text: "วีไอพี พีพีซุปเปอร์วีล",
              scale: 1.5,
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
                  text: "ทะเบียนรถ : ",
                  scale: 1.5,
                ),
              ),
            ),
            const CustomText(
              text: "8ศฐ 168",
              scale: 1.5,
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
                  text: "โทรศัพท์ : ",
                  scale: 1.5,
                ),
              ),
            ),
            const CustomText(
              text: "09888888888",
              scale: 1.5,
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
                  text: "email : ",
                  scale: 1.5,
                ),
              ),
            ),
            const CustomText(
              text: "ppsw@ppsw.com",
              scale: 1.5,
            ),
          ],
        ),
      ],
    ),
  );
}

class WarrantySearchWidget extends StatelessWidget {
  WarrantySearchWidget({
    super.key,
  });

  final nameTextController = TextEditingController();
  final licensePlate = TextEditingController();
  final mobileNoTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // flex: 2,
      child: Container(
        // color: Colors.amber,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomText(
              text: "ชื่อ-นามสกุล",
              weight: FontWeight.bold,
              size: 18,
            ),
            const SizedBox(width: defaultPadding / 2),
            Expanded(
              child: TextFormField(
                controller: nameTextController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  fillColor: Colors.white.withOpacity(.8),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultPadding / 2),
                    borderSide:
                        const BorderSide(color: Colors.black54, width: 1),
                  ),
                  isCollapsed: true,
                  contentPadding: const EdgeInsets.fromLTRB(12, 14, 12, 12),
                ),
              ),
            ),
            const SizedBox(width: defaultPadding / 2),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    vertical: defaultPadding, horizontal: defaultPadding / 2),
              ),
              icon: const Icon(
                Icons.search_sharp,
              ),
              label: const CustomText(
                text: "ค้นหา",
                color: Colors.white,
              ),
              onPressed: () {
                // controller.listSystemLinkDealerByCode(
                //   dealerCodeTextController.text,
                // );
              },
            ),
            const SizedBox(width: defaultPadding / 2),
            const CustomText(
              text: "ทะเบียนรถ",
              weight: FontWeight.bold,
              size: 18,
            ),
            const SizedBox(width: defaultPadding / 2),
            Expanded(
              child: TextFormField(
                controller: licensePlate,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  fillColor: Colors.white.withOpacity(.8),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultPadding / 2),
                    borderSide:
                        const BorderSide(color: Colors.black54, width: 1),
                  ),
                  isCollapsed: true,
                  contentPadding: const EdgeInsets.fromLTRB(12, 14, 12, 12),
                ),
              ),
            ),
            const SizedBox(width: defaultPadding / 2),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    vertical: defaultPadding, horizontal: defaultPadding / 2),
              ),
              icon: const Icon(
                Icons.search_sharp,
              ),
              label: const CustomText(
                text: "ค้นหา",
                color: Colors.white,
              ),
              onPressed: () {
                // controller.listSystemLinkDealerByCode(
                //   dealerCodeTextController.text,
                // );
              },
            ),
            const SizedBox(width: defaultPadding / 2),
            const CustomText(
              text: "หมายเลขโทรศัพท์",
              weight: FontWeight.bold,
              size: 18,
            ),
            const SizedBox(width: defaultPadding / 2),
            Expanded(
              child: TextFormField(
                controller: mobileNoTextController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  fillColor: Colors.white.withOpacity(.8),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultPadding / 2),
                    borderSide:
                        const BorderSide(color: Colors.black54, width: 1),
                  ),
                  isCollapsed: true,
                  contentPadding: const EdgeInsets.fromLTRB(12, 14, 12, 12),
                ),
              ),
            ),
            const SizedBox(width: defaultPadding / 2),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    vertical: defaultPadding, horizontal: defaultPadding / 2),
              ),
              icon: const Icon(
                Icons.search_sharp,
              ),
              label: const CustomText(
                text: "ค้นหา",
                color: Colors.white,
              ),
              onPressed: () {
                // controller.listSystemLinkDealerByCode(
                //   dealerCodeTextController.text,
                // );
              },
            ),
            const SizedBox(width: defaultPadding / 2),
          ],
        ),
      ),
    );
  }
}
