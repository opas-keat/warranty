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
              width: 120,
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
              scale: 0.9,
            ),
            const SizedBox(height: defaultPadding / 4),
            const Divider(height: 1, color: Colors.black87),
            const RegisterDetail(),
            const Divider(height: 1, color: Colors.black87),
            const SizedBox(height: defaultPadding / 2),
            const Padding(
              padding: EdgeInsets.only(left: defaultPadding / 2),
              child: Row(
                children: [
                  CustomText(
                    text: 'สินค้า',
                    scale: 0.9,
                  ),
                ],
              ),
            ),
            Expanded(
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
            const SizedBox(height: defaultPadding / 4),
            const Divider(height: 1, color: Colors.black87),
            const SizedBox(height: defaultPadding / 4),
            const CompanyInfo(),
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
        const EdgeInsets.only(left: defaultPadding / 2, top: defaultPadding),
    child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CustomText(
                text:
                    'ประเภท ยางรถยนต์ แบรนด์ ${product.productBrand} จำนวน ${product.productAmount} เส้น',
                scale: 0.9,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: defaultPadding / 2),
          child: Row(
            children: [
              const Expanded(
                child: CustomText(
                  text: '- รับประกันสภาพยาง 2 ปี',
                  scale: 0.9,
                ),
              ),
              Expanded(
                child: CustomText(
                  text: 'การรับประกันหมดอายุ ${product.productTireExpire}',
                  scale: 0.9,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: defaultPadding / 2),
          child: Row(
            children: [
              const Expanded(
                child: CustomText(
                  text: '- รับประกันระยะ 50,000 กม.',
                  scale: 0.9,
                ),
              ),
              Expanded(
                child: CustomText(
                  text: 'การรับประกันหมดอายุ ${product.productMileExpire} กม.',
                  scale: 0.9,
                ),
              ),
            ],
          ),
        ),
        const CustomText(
          text: '**การรับประกันจะหมด หากอย่างใดอย่างหนึ่งถึงก่อน**',
          scale: 0.9,
          color: Colors.red,
        ),
        Padding(
          padding: const EdgeInsets.only(left: defaultPadding / 2),
          child: Row(
            children: [
              const Expanded(
                child: CustomText(
                  maxLine: 2,
                  text: '- รับประกันตามแคมเปญ บาด บวม แตก ตำ 60 วัน',
                  scale: 0.9,
                ),
              ),
              Expanded(
                child: CustomText(
                  text: 'การรับประกันหมดอายุ ${product.productPromotionExpire}',
                  scale: 0.9,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget productDetailWheel(
  Products product,
) {
  return Padding(
    padding:
        const EdgeInsets.only(left: defaultPadding / 2, top: defaultPadding),
    child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CustomText(
                text:
                    'ประเภท ล้อแม็ก แบรนด์ ${product.productBrand} จำนวน ${product.productAmount} วง',
                scale: 0.9,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: defaultPadding / 2),
          child: Row(
            children: [
              const Expanded(
                child: CustomText(
                  text: '- รับประกันโครงสร้าง 6 ปี',
                  scale: 0.9,
                ),
              ),
              Expanded(
                child: CustomText(
                  text: 'การรับประกันหมดอายุ ${product.productStructureExpire}',
                  scale: 0.9,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: defaultPadding / 2),
          child: Row(
            children: [
              const Expanded(
                child: CustomText(
                  text: '- รับประกันสี 6 เดือน',
                  scale: 0.9,
                ),
              ),
              Expanded(
                child: CustomText(
                  text: 'การรับประกันหมดอายุ ${product.productColorExpire}',
                  scale: 0.9,
                ),
              ),
            ],
          ),
        ),
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
                      scale: 0.9,
                    ),
                    CustomText(
                      maxLine: 2,
                      text:
                          '74/14 หมู่ 6 ตำบลบางจาก อำเภอพระประแดง จังหวัดสมุทรปราการ รหัสไปรษณีย์ 10130',
                      scale: 0.8,
                    ),
                    CustomText(
                      maxLine: 2,
                      text:
                          'อีเมล info@ppsuperwheels.com, โทร 024086794-6, LineID @ppsuperwheels',
                      scale: 0.8,
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
            scale: 0.8,
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
                  scale: 0.9,
                  weight: FontWeight.bold,
                ),
                const SizedBox(width: defaultPadding / 4),
                Expanded(
                  child: CustomText(
                    text: controller.warrantyData.value.warrantyNo,
                    scale: 0.9,
                  ),
                ),
                const SizedBox(width: 1),
                CustomText(
                  text: controller.warrantyData.value.warrantyDate,
                  scale: 0.9,
                ),
              ],
            ),
            const SizedBox(height: defaultPadding / 2),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(
                  text: 'ตัวแทนจำหน่าย ',
                  scale: 0.9,
                  weight: FontWeight.bold,
                ),
                const SizedBox(width: defaultPadding / 4),
                Expanded(
                  child: CustomText(
                    maxLine: 3,
                    text: controller.warrantyData.value.dealerName,
                    scale: 0.9,
                  ),
                ),
              ],
            ),
            const SizedBox(height: defaultPadding / 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText(
                  text: 'ชื่อ - นามสกุล ',
                  scale: 0.9,
                  weight: FontWeight.bold,
                ),
                const SizedBox(width: defaultPadding / 4),
                Expanded(
                  child: CustomText(
                    text: controller.warrantyData.value.customerName,
                    scale: 0.9,
                  ),
                ),
              ],
            ),
            const SizedBox(height: defaultPadding / 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText(
                  text: 'เบอร์โทร ',
                  scale: 0.9,
                  weight: FontWeight.bold,
                ),
                const SizedBox(width: defaultPadding / 4),
                Expanded(
                  child: CustomText(
                    text: controller.warrantyData.value.customerPhone,
                    scale: 0.9,
                  ),
                ),
                const CustomText(
                  text: 'Email ',
                  scale: 0.9,
                  weight: FontWeight.bold,
                ),
                const SizedBox(width: defaultPadding / 4),
                CustomText(
                  text: controller.warrantyData.value.customerEmail,
                  scale: 0.9,
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
                        scale: 0.9,
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
                        scale: 0.9,
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
