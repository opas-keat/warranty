import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            RegisterDetail(),
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
            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ProductDetailWheel(),
                    ProductDetailWheel(),
                    ProductDetailTire(),
                    ProductDetailTire(),
                    ProductDetailWheel(),
                  ],
                ),
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

class ProductDetailTire extends StatelessWidget {
  const ProductDetailTire({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: defaultPadding / 2, top: defaultPadding),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CustomText(
                  text: 'ประเภท ยางรถยนต์ แบรนด์ Cosmis จำนวน 4 เส้น',
                  scale: 0.9,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: defaultPadding / 2),
            child: Row(
              children: [
                Expanded(
                  child: CustomText(
                    text: '- รับประกันสภาพยาง 2 ปี',
                    scale: 0.9,
                  ),
                ),
                Expanded(
                  child: CustomText(
                    text: 'การรับประกันหมดอายุ 31/12/23',
                    scale: 0.9,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: defaultPadding / 2),
            child: Row(
              children: [
                Expanded(
                  child: CustomText(
                    text: '- รับประกันระยะ 50,000 กม.',
                    scale: 0.9,
                  ),
                ),
                Expanded(
                  child: CustomText(
                    text: 'การรับประกันหมดอายุ 99,999 กม.',
                    scale: 0.9,
                  ),
                ),
              ],
            ),
          ),
          CustomText(
            text: '**การรับประกันจะหมด หากอย่างใดอย่างหนึ่งถึงก่อน**',
            scale: 0.9,
            color: Colors.red,
          ),
          Padding(
            padding: EdgeInsets.only(left: defaultPadding / 2),
            child: Row(
              children: [
                Expanded(
                  child: CustomText(
                    maxLine: 2,
                    text: '- รับประกันตามแคมเปญ บาด บวม แตก ตำ 60 วัน',
                    scale: 0.9,
                  ),
                ),
                Expanded(
                  child: CustomText(
                    text: 'การรับประกันหมดอายุ 31/12/23',
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
}

class ProductDetailWheel extends StatelessWidget {
  const ProductDetailWheel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: defaultPadding / 2, top: defaultPadding),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CustomText(
                  text: 'ประเภท ล้อแม็ก แบรนด์ Cosmis จำนวน 4 วง',
                  scale: 0.9,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: defaultPadding / 2),
            child: Row(
              children: [
                Expanded(
                  child: CustomText(
                    text: '- รับประกันโครงสร้าง 6 ปี',
                    scale: 0.9,
                  ),
                ),
                Expanded(
                  child: CustomText(
                    text: 'การรับประกันหมดอายุ 31/12/23',
                    scale: 0.9,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: defaultPadding / 2),
            child: Row(
              children: [
                Expanded(
                  child: CustomText(
                    text: '- รับประกันlu 6 เดือน',
                    scale: 0.9,
                  ),
                ),
                Expanded(
                  child: CustomText(
                    text: 'การรับประกันหมดอายุ 31/12/23',
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
  RegisterDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(defaultPadding / 2),
      child: Column(
        children: [
          SizedBox(height: defaultPadding / 2),
          Row(
            children: [
              CustomText(
                text: 'เลขที่ใบรับประกัน',
                scale: 0.9,
                weight: FontWeight.bold,
              ),
              SizedBox(width: defaultPadding / 4),
              Expanded(
                child: CustomText(
                  text: 'WT-20031031000001',
                  scale: 0.9,
                ),
              ),
              SizedBox(width: 1),
              CustomText(
                text: '10/10/2003 11:22:33',
                scale: 0.9,
              ),
            ],
          ),
          SizedBox(height: defaultPadding / 2),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'ตัวแทนจำหน่าย ',
                scale: 0.9,
                weight: FontWeight.bold,
              ),
              SizedBox(width: defaultPadding / 4),
              Expanded(
                child: CustomText(
                  maxLine: 3,
                  text:
                      'บริษัท เอ็นเอส ออโต้วีล จำกัด 654/2 ถ.บางบอน 3 แขวงบางบอน เขตบางบอน กรุงเทพมหานคร 10150 โทรศัพท์ : 095-116-2966   โทรสาร : ',
                  scale: 0.9,
                ),
              ),
            ],
          ),
          SizedBox(height: defaultPadding / 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: 'ชื่อ - นามสกุล ',
                scale: 0.9,
                weight: FontWeight.bold,
              ),
              SizedBox(width: defaultPadding / 4),
              Expanded(
                child: CustomText(
                  text: 'พีพีซุปเปอร์วิีล สำนักงานใหญ่',
                  scale: 0.9,
                ),
              ),
            ],
          ),
          SizedBox(height: defaultPadding / 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: 'เบอร์โทร ',
                scale: 0.9,
                weight: FontWeight.bold,
              ),
              SizedBox(width: defaultPadding / 4),
              Expanded(
                child: CustomText(
                  text: '024086794',
                  scale: 0.9,
                ),
              ),
              CustomText(
                text: 'Email ',
                scale: 0.9,
                weight: FontWeight.bold,
              ),
              SizedBox(width: defaultPadding / 4),
              CustomText(
                text: 'ppsuperwheels@ppws.com',
                scale: 0.9,
              ),
            ],
          ),
          SizedBox(height: defaultPadding / 2),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    CustomText(
                      text: 'ทะเบียนรถ ',
                      scale: 0.9,
                      weight: FontWeight.bold,
                    ),
                    CustomText(
                      text: 'ร่ำรวย 168',
                      scale: 0.9,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    CustomText(
                      text: 'เลขไมล์ ',
                      scale: 0.9,
                      weight: FontWeight.bold,
                    ),
                    CustomText(
                      text: '666',
                      scale: 0.9,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: defaultPadding / 2),
        ],
      ),
    );
  }
}
