import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/constant.dart';
import '../../../../shared/custom_text.dart';
import '../controllers/config_controller.dart';

class ConfigList extends StatelessWidget {
  const ConfigList({super.key});

  @override
  Widget build(BuildContext context) {
    final ConfigController controller = Get.put(ConfigController());
    return Column(
      children: [
        const SizedBox(height: defaultPadding),
        Container(
          padding: const EdgeInsets.all(defaultPadding / 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defaultPadding),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Row(
                  children: [
                    Expanded(
                      child: CustomText(
                        text: "การคำนวน",
                        weight: FontWeight.bold,
                        scale: 1.8,
                      ),
                    ),
                  ],
                ),
                accentDividerTop,
                const ConfigDetail(),
                // const Row(
                //   children: [
                //     Expanded(
                //       child: CustomText(
                //         text: "ผู้ใช้งาน",
                //         weight: FontWeight.bold,
                //         scale: 1.8,
                //       ),
                //     ),
                //   ],
                // ),
                // accentDividerTop,
              ],
            ),
          ),
        ),
        const SizedBox(height: defaultPadding / 2),
      ],
    );
  }
}

class ConfigDetail extends StatelessWidget {
  const ConfigDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ConfigController controller = Get.put(ConfigController());
    return Column(
      children: [
        const SizedBox(height: defaultPadding),
        Row(
          children: [
            const SizedBox(
              width: 200,
              child: CustomText(
                text: "WarrantyWheelColor",
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: defaultPadding),
              width: 300,
              child: TextFormField(
                controller: controller.configWarrantyWheelColor,
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
            const SizedBox(width: defaultPadding),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    vertical: defaultPadding, horizontal: defaultPadding / 2),
              ),
              icon: const Icon(
                Icons.edit_sharp,
              ),
              label: const CustomText(
                text: "อัพเดต",
                color: Colors.white,
              ),
              onPressed: () async {
                await controller.updateConfig(
                  "WarrantyWheelColor",
                  controller.configWarrantyWheelColor.text,
                );
              },
            ),
          ],
        ),
        const SizedBox(height: defaultPadding),
        Row(
          children: [
            const SizedBox(
              width: 200,
              child: CustomText(
                text: "WarrantyTireMileZestino",
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: defaultPadding),
              width: 300,
              child: TextFormField(
                controller: controller.configWarrantyTireMileZestino,
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
            const SizedBox(width: defaultPadding),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    vertical: defaultPadding, horizontal: defaultPadding / 2),
              ),
              icon: const Icon(
                Icons.edit_sharp,
              ),
              label: const CustomText(
                text: "อัพเดต",
                color: Colors.white,
              ),
              onPressed: () async {
                await controller.updateConfig(
                  "WarrantyTireMileZestino",
                  controller.configWarrantyTireMileZestino.text,
                );
              },
            ),
          ],
        ),
        const SizedBox(height: defaultPadding),
        Row(
          children: [
            const SizedBox(
              width: 200,
              child: CustomText(
                text: "WarrantyTireYear",
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: defaultPadding),
              width: 300,
              child: TextFormField(
                controller: controller.configWarrantyTireYear,
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
            const SizedBox(width: defaultPadding),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    vertical: defaultPadding, horizontal: defaultPadding / 2),
              ),
              icon: const Icon(
                Icons.edit_sharp,
              ),
              label: const CustomText(
                text: "อัพเดต",
                color: Colors.white,
              ),
              onPressed: () async {
                await controller.updateConfig(
                  "WarrantyTireYear",
                  controller.configWarrantyTireYear.text,
                );
              },
            ),
          ],
        ),
        const SizedBox(height: defaultPadding),
        Row(
          children: [
            const SizedBox(
              width: 200,
              child: CustomText(
                text: "WarrantyTireYearZestino",
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: defaultPadding),
              width: 300,
              child: TextFormField(
                controller: controller.configWarrantyTireYearZestino,
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
            const SizedBox(width: defaultPadding),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    vertical: defaultPadding, horizontal: defaultPadding / 2),
              ),
              icon: const Icon(
                Icons.edit_sharp,
              ),
              label: const CustomText(
                text: "อัพเดต",
                color: Colors.white,
              ),
              onPressed: () async {
                await controller.updateConfig(
                  "WarrantyTireYearZestino",
                  controller.configWarrantyTireYearZestino.text,
                );
              },
            ),
          ],
        ),
        const SizedBox(height: defaultPadding),
        Row(
          children: [
            const SizedBox(
              width: 200,
              child: CustomText(
                text: "WarrantyPromotionTire",
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: defaultPadding),
              width: 300,
              child: TextFormField(
                controller: controller.configWarrantyPromotionTire,
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
            const SizedBox(width: defaultPadding),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    vertical: defaultPadding, horizontal: defaultPadding / 2),
              ),
              icon: const Icon(
                Icons.edit_sharp,
              ),
              label: const CustomText(
                text: "อัพเดต",
                color: Colors.white,
              ),
              onPressed: () async {
                await controller.updateConfig(
                  "WarrantyPromotionTire",
                  controller.configWarrantyPromotionTire.text,
                );
              },
            ),
          ],
        ),
        const SizedBox(height: defaultPadding),
        Row(
          children: [
            const SizedBox(
              width: 200,
              child: CustomText(
                text: "WarrantyTireMile",
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: defaultPadding),
              width: 300,
              child: TextFormField(
                controller: controller.configWarrantyTireMile,
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
            const SizedBox(width: defaultPadding),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    vertical: defaultPadding, horizontal: defaultPadding / 2),
              ),
              icon: const Icon(
                Icons.edit_sharp,
              ),
              label: const CustomText(
                text: "อัพเดต",
                color: Colors.white,
              ),
              onPressed: () async {
                await controller.updateConfig(
                  "WarrantyTireMile",
                  controller.configWarrantyTireMile.text,
                );
              },
            ),
          ],
        ),
        const SizedBox(height: defaultPadding),
        Row(
          children: [
            const SizedBox(
              width: 200,
              child: CustomText(
                text: "WarrantyWheelYear",
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: defaultPadding),
              width: 300,
              child: TextFormField(
                controller: controller.configWarrantyWheelYear,
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
            const SizedBox(width: defaultPadding),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    vertical: defaultPadding, horizontal: defaultPadding / 2),
              ),
              icon: const Icon(
                Icons.edit_sharp,
              ),
              label: const CustomText(
                text: "อัพเดต",
                color: Colors.white,
              ),
              onPressed: () async {
                await controller.updateConfig(
                  "WarrantyWheelYear",
                  controller.configWarrantyWheelYear.text,
                );
              },
            ),
          ],
        ),
        const SizedBox(height: defaultPadding),
        Row(
          children: [
            const SizedBox(
              width: 200,
              child: CustomText(
                text: "Campange",
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: defaultPadding),
              width: 300,
              child: TextFormField(
                controller: controller.configCampange,
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
            const SizedBox(width: defaultPadding),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    vertical: defaultPadding, horizontal: defaultPadding / 2),
              ),
              icon: const Icon(
                Icons.edit_sharp,
              ),
              label: const CustomText(
                text: "อัพเดต",
                color: Colors.white,
              ),
              onPressed: () async {
                await controller.updateConfig(
                  "Campange",
                  controller.configCampange.text,
                );
              },
            ),
          ],
        ),
        const SizedBox(height: defaultPadding),
        // Row(
        //   children: [
        //     const SizedBox(
        //       width: 200,
        //     ),
        //     Container(
        //       padding: const EdgeInsets.only(left: defaultPadding),
        //       width: 300,
        //       child: Row(
        //         children: [
        //           ElevatedButton.icon(
        //             style: ElevatedButton.styleFrom(
        //               padding: const EdgeInsets.symmetric(
        //                   vertical: defaultPadding,
        //                   horizontal: defaultPadding / 2),
        //             ),
        //             icon: const Icon(
        //               Icons.save_sharp,
        //             ),
        //             label: const CustomText(
        //               text: "บันทึก",
        //               color: Colors.white,
        //             ),
        //             onPressed: () {},
        //           ),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
