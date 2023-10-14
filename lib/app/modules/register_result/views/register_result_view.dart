import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/response/warranty_service_response.dart';
import '../../../shared/constant.dart';
import '../../../shared/custom_text.dart';
import '../controllers/register_result_controller.dart';

class RegisterResultView extends StatelessWidget {
  RegisterResultView({Key? key}) : super(key: key);
  final RegisterResultController controller =
      Get.put(RegisterResultController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          children: [
            SizedBox(
              width: 140,
              child: Image.network(
                "assets/images/logo_0.png",
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: null,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(height: 1, color: Colors.black87),
            const SizedBox(height: defaultPadding / 4),
            const CustomText(
              text: "ลงทะเบียนรับประกัน",
              color: Colors.black,
              scale: 1.0,
            ),
            const SizedBox(height: defaultPadding / 4),
            const Divider(height: 1, color: Colors.black87),
            const RegisterDetail(),
            const Divider(height: 1, color: Colors.black87),
            // const SizedBox(height: defaultPadding / 2),
            // const Padding(
            //   padding: EdgeInsets.only(left: defaultPadding / 2),
            //   child: Row(
            //     children: [
            //       CustomText(
            //         text: 'สินค้า',
            //         scale: 1.0,
            //       ),
            //     ],
            //   ),
            // ),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Obx(
                  () => Column(
                    children: List.generate(
                        controller.warrantyData.value.products!.length,
                        (index) {
                      if (controller.warrantyData.value.products![index]
                              .productType ==
                          'wheels') {
                        return productDetailWheel(
                          controller.warrantyData.value.products![index],
                        );
                      } else {
                        return productDetailTire(
                          controller.warrantyData.value.products![index],
                        );
                      }
                    }),
                  ),
                ),
                // child: Column(
                //   children: [
                //     ProductDetailWheel(),
                //     ProductDetailWheel(),
                //     ProductDetailTire(),
                //     ProductDetailTire(),
                //     ProductDetailWheel(),
                //   ],
                // ),
              ),
            ),
            // Expanded(
            //   flex: 1,
            //   child: Obx(
            //     () => Column(
            //       children: List.generate(
            //           controller.warrantyData.value.products!.length,
            //           (index) {
            //         if (controller.warrantyData.value.products![index]
            //                 .productType ==
            //             'tire' && controller.warrantyData.value.products![index]
            //                 .productBrand != 'COSMIS') {
            //           return productDetailWheel(
            //             controller.warrantyData.value.products![index],
            //           );
            //         } else {
            //           return productDetailTire(
            //             controller.warrantyData.value.products![index],
            //           );
            //         }
            //       }),
            //     ),
            //   ),
            // ),
            const SizedBox(height: defaultPadding / 4),
            const Divider(height: 1, color: Colors.black87),
            const SizedBox(height: defaultPadding / 4),
            const SizedBox(
              height: 250,
              child: CompanyInfo(),
            ),
          ],
        ),
      ),
    );
  }
}

Widget productDetailTire(
  Products product,
) {
  return Padding(
    padding:
        const EdgeInsets.only(left: defaultPadding / 4, top: defaultPadding),
    child: Column(
      children: [
        const Row(
          children: [
            Expanded(
              flex: 1,
              child: CustomText(
                text: 'ประกันสินค้า',
                scale: 1.0,
              ),
            ),
            Expanded(
              flex: 2,
              child: CustomText(
                text: 'ประเภท ยางรถยนต์',
                scale: 1.0,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: CustomText(
                text: 'แบรนด์ ${product.productBrand}',
                scale: 1.0,
              ),
            ),
            Expanded(
              flex: 1,
              child: CustomText(
                text: 'จำนวน ${product.productAmount} เส้น',
                scale: 1.0,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: defaultPadding / 4),
              child: CustomText(
                text: 'การรับประกันหมดอายุ',
                scale: 1.0,
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Expanded(
              flex: 1,
              child: CustomText(
                text: '- รับประกันคุณภาพตามกระบวนการผลิต',
                scale: 1.0,
                maxLine: 2,
              ),
            ),
            const Expanded(
              flex: 1,
              child: CustomText(
                text: '2 ปี',
                scale: 1.0,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: defaultPadding / 4),
                child: CustomText(
                  text: '${product.productTireExpire}',
                  scale: 1.0,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Expanded(
              flex: 1,
              child: CustomText(
                text: '- รับประกันระยะ',
                scale: 1.0,
              ),
            ),
            const Expanded(
              flex: 1,
              child: CustomText(
                text: '50,000 กม.',
                scale: 1.0,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: defaultPadding / 4),
                child: CustomText(
                  text: '${product.productMileExpire} กม.',
                  scale: 1.0,
                ),
              ),
            ),
          ],
        ),
        const CustomText(
          text: '**การรับประกันจะหมด หากอย่างใดอย่างหนึ่งถึงก่อน**',
          scale: 1.0,
          color: Colors.red,
        ),
        const SizedBox(height: defaultPadding),
        product.productBrand != 'COSMIS'
            ? const Padding(
                padding: EdgeInsets.only(left: defaultPadding / 2),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: CustomText(
                        text: 'แคมเปญ',
                        scale: 1.0,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: CustomText(
                        text: 'ประเภท ยางรถยนต์',
                        scale: 1.0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: defaultPadding / 4),
                      child: CustomText(
                        text: 'การรับประกันหมดอายุ',
                        scale: 1.0,
                      ),
                    ),
                  ],
                ),
              )
            : Container(),
        product.productBrand != 'COSMIS'
            ? Padding(
                padding: const EdgeInsets.only(left: defaultPadding / 2),
                child: Row(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: CustomText(
                        text: '- รับประกัน บาด บวม แตก ตำ',
                        scale: 1.0,
                        maxLine: 2,
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: CustomText(
                        text: '60 วัน',
                        scale: 1.0,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerRight,
                        padding:
                            const EdgeInsets.only(right: defaultPadding / 4),
                        child: CustomText(
                          text: '${product.productPromotionExpire}',
                          scale: 1.0,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Container(),
        //   Row(
        //     children: [
        //       Expanded(
        //         child: CustomText(
        //           text:
        //               'ประเภท ยางรถยนต์ แบรนด์ ${product.productBrand} จำนวน ${product.productAmount} เส้น',
        //           scale: 1.0,
        //         ),
        //       ),
        //     ],
        //   ),
        //   Padding(
        //     padding: const EdgeInsets.only(left: defaultPadding / 2),
        //     child: Row(
        //       children: [
        //         const Expanded(
        //           child: CustomText(
        //             text: '- รับประกันสภาพยาง 2 ปี',
        //             scale: 1.0,
        //           ),
        //         ),
        //         Expanded(
        //           child: CustomText(
        //             text: 'การรับประกันหมดอายุ ${product.productTireExpire}',
        //             scale: 1.0,
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        //   Padding(
        //     padding: const EdgeInsets.only(left: defaultPadding / 2),
        //     child: Row(
        //       children: [
        //         const Expanded(
        //           child: CustomText(
        //             text: '- รับประกันระยะ 50,000 กม.',
        //             scale: 1.0,
        //           ),
        //         ),
        //         Expanded(
        //           child: CustomText(
        //             text: 'การรับประกันหมดอายุ ${product.productMileExpire} กม.',
        //             scale: 1.0,
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        //   const CustomText(
        //     text: '**การรับประกันจะหมด หากอย่างใดอย่างหนึ่งถึงก่อน**',
        //     scale: 1.0,
        //     color: Colors.red,
        //   ),
        //   product.productBrand == 'COSMIS'
        //       ? Padding(
        //           padding: const EdgeInsets.only(left: defaultPadding / 2),
        //           child: Row(
        //             children: [
        //               const Expanded(
        //                 child: CustomText(
        //                   maxLine: 2,
        //                   text: '- รับประกันตามแคมเปญ บาด บวม แตก ตำ 60 วัน',
        //                   scale: 1.0,
        //                 ),
        //               ),
        //               Expanded(
        //                 child: CustomText(
        //                   text:
        //                       'การรับประกันหมดอายุ ${product.productPromotionExpire}',
        //                   scale: 1.0,
        //                 ),
        //               ),
        //             ],
        //           ),
        //         )
        //       : Container(),
      ],
    ),
  );
}

Widget productDetailWheel(
  Products product,
) {
  return Padding(
    padding: const EdgeInsets.only(
      left: defaultPadding / 2,
      top: defaultPadding,
    ),
    child: Column(
      children: [
        const Row(
          children: [
            Expanded(
              flex: 1,
              child: CustomText(
                text: 'ประกันสินค้า',
                scale: 1.0,
              ),
            ),
            Expanded(
              flex: 2,
              child: CustomText(
                text: 'ประเภท ล้อแม็ก',
                scale: 1.0,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: CustomText(
                text: 'แบรนด์ ${product.productBrand}',
                scale: 1.0,
              ),
            ),
            Expanded(
              flex: 1,
              child: CustomText(
                text: 'จำนวน ${product.productAmount} วง',
                scale: 1.0,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: defaultPadding / 4),
              child: CustomText(
                text: 'การรับประกันหมดอายุ',
                scale: 1.0,
              ),
            ),
            // Expanded(
            //   flex: 1,
            //   child: Container(
            //     padding: const EdgeInsets.only(right: defaultPadding / 4),
            //     child: CustomText(
            //       text: 'การรับประกันหมดอายุ',
            //       scale: 1.0,
            //     ),
            //   ),
            // ),
          ],
        ),
        Row(
          children: [
            const Expanded(
              flex: 1,
              child: CustomText(
                text: '- รับประกันโครงสร้าง',
                scale: 1.0,
              ),
            ),
            const Expanded(
              flex: 1,
              child: CustomText(
                text: '6 ปี',
                scale: 1.0,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: defaultPadding / 4),
                child: CustomText(
                  text: '${product.productStructureExpire}',
                  scale: 1.0,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Expanded(
              flex: 1,
              child: CustomText(
                text: '- รับประกันสี',
                scale: 1.0,
              ),
            ),
            const Expanded(
              flex: 1,
              child: CustomText(
                text: '6 เดือน',
                scale: 1.0,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: defaultPadding / 4),
                child: CustomText(
                  text: '${product.productColorExpire}',
                  scale: 1.0,
                ),
              ),
            ),
          ],
        ),
        // Row(
        //   children: [
        //     Expanded(
        //       child: CustomText(
        //         text:
        //             'ประเภท ล้อแม็ก แบรนด์ ${product.productBrand} จำนวน ${product.productAmount} วง',
        //         scale: 1.0,
        //       ),
        //     ),
        //   ],
        // ),
        // Padding(
        //   padding: const EdgeInsets.only(left: defaultPadding / 2),
        //   child: Row(
        //     children: [
        //       const Expanded(
        //         child: CustomText(
        //           text: '- รับประกันโครงสร้าง 6 ปี',
        //           scale: 1.0,
        //         ),
        //       ),
        //       Expanded(
        //         child: CustomText(
        //           text: 'การรับประกันหมดอายุ ${product.productStructureExpire}',
        //           scale: 1.0,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        // Padding(
        //   padding: const EdgeInsets.only(left: defaultPadding / 2),
        //   child: Row(
        //     children: [
        //       const Expanded(
        //         child: CustomText(
        //           text: '- รับประกันสี 6 เดือน',
        //           scale: 1.0,
        //         ),
        //       ),
        //       Expanded(
        //         child: CustomText(
        //           text: 'การรับประกันหมดอายุ ${product.productColorExpire}',
        //           scale: 1.0,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    ),
  );
}

class CompanyInfo extends StatelessWidget {
  const CompanyInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding / 2),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Flexible(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'ข้อมูลติดต่อบริษัท',
                      scale: 1.0,
                    ),
                    CustomText(
                      maxLine: 2,
                      text:
                          '74/14 หมู่ 6 ตำบลบางจาก อำเภอพระประแดง จังหวัดสมุทรปราการ รหัสไปรษณีย์ 10130',
                      scale: 1.0,
                    ),
                    CustomText(
                      maxLine: 2,
                      text:
                          'อีเมล info@ppsuperwheels.com, โทร 024086794-6, LineID @ppsuperwheels',
                      scale: 1.0,
                    ),
                  ],
                ),
              ),
              Flexible(
                child: SizedBox(
                  height: 72,
                  child: Image.network(
                    "assets/images/M_ppsuperwheels_GW_0.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: defaultPadding / 4),
          const CustomText(
            maxLine: 2,
            text:
                'กรุณาบันทึกเอกสารการรับประกันนี้เก็บไว้เพื่อเป็นหลักฐานในการส่งรับประกันสินค้า',
            scale: 1.0,
            color: Colors.red,
          ),
          const SizedBox(height: defaultPadding / 4),
        ],
      ),
    );
  }
}

class RegisterDetail extends StatelessWidget {
  const RegisterDetail({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final RegisterResultController controller =
        Get.find<RegisterResultController>();
    return Padding(
      padding: const EdgeInsets.all(defaultPadding / 2),
      child: Obx(
        () => Column(
          children: [
            const SizedBox(height: defaultPadding / 2),
            Row(
              children: [
                const CustomText(
                  text: 'เลขที่ใบรับประกัน',
                  scale: 1.0,
                  weight: FontWeight.bold,
                ),
                const SizedBox(width: defaultPadding / 4),
                const Expanded(
                  child: CustomText(
                    // text: controller.warrantyData.value.warrantyNo,
                    text: '2309000001',
                    scale: 1.0,
                  ),
                ),
                const SizedBox(width: 1),
                CustomText(
                  text: controller.warrantyData.value.warrantyDate,
                  scale: 1.0,
                ),
              ],
            ),
            const SizedBox(height: defaultPadding / 2),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(
                  text: 'ตัวแทนจำหน่าย ',
                  scale: 1.0,
                  weight: FontWeight.bold,
                ),
                const SizedBox(width: defaultPadding / 4),
                Expanded(
                  child: CustomText(
                    maxLine: 3,
                    text: controller.warrantyData.value.dealerName,
                    scale: 1.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: defaultPadding + 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText(
                  text: 'ชื่อ - นามสกุล ',
                  scale: 1.0,
                  weight: FontWeight.bold,
                ),
                const SizedBox(width: defaultPadding / 4),
                Expanded(
                  child: CustomText(
                    text: controller.warrantyData.value.customerName,
                    scale: 1.0,
                  ),
                ),
              ],
            ),
            // const SizedBox(height: defaultPadding / 2),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     const CustomText(
            //       text: 'เบอร์โทร ',
            //       scale: 1.0,
            //       weight: FontWeight.bold,
            //     ),
            //     const SizedBox(width: defaultPadding / 4),
            //     Expanded(
            //       child: CustomText(
            //         text: controller.warrantyData.value.customerPhone,
            //         scale: 1.0,
            //       ),
            //     ),
            //     const CustomText(
            //       text: 'Email ',
            //       scale: 1.0,
            //       weight: FontWeight.bold,
            //     ),
            //     const SizedBox(width: defaultPadding / 4),
            //     CustomText(
            //       text: controller.warrantyData.value.customerEmail,
            //       scale: 1.0,
            //     ),
            //   ],
            // ),
            const SizedBox(height: defaultPadding / 2),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const CustomText(
                        text: 'เบอร์โทร ',
                        scale: 1.0,
                        weight: FontWeight.bold,
                      ),
                      CustomText(
                        text: controller.warrantyData.value.customerPhone,
                        scale: 0.9,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      const CustomText(
                        text: 'Email ',
                        scale: 1.0,
                        weight: FontWeight.bold,
                      ),
                      CustomText(
                        text: controller.warrantyData.value.customerEmail,
                        scale: 0.9,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: defaultPadding / 2),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const CustomText(
                        text: 'ทะเบียนรถ ',
                        scale: 1.0,
                        weight: FontWeight.bold,
                      ),
                      CustomText(
                        text:
                            controller.warrantyData.value.customerLicensePlate,
                        scale: 0.9,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      const CustomText(
                        text: 'เลขไมล์ ',
                        scale: 1.0,
                        weight: FontWeight.bold,
                      ),
                      CustomText(
                        text: controller.warrantyData.value.customerMile,
                        scale: 0.9,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: defaultPadding / 2),
          ],
        ),
      ),
    );
  }
}
