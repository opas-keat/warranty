import 'package:flutter/material.dart';

import '../../../../shared/constant.dart';
import '../../../../shared/custom_text.dart';

class WarrantyList extends StatelessWidget {
  WarrantyList({super.key});

  final mobileNoTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            Expanded(
              flex: 2,
              child: Container(
                // color: Colors.amber,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                            borderRadius:
                                BorderRadius.circular(defaultPadding / 2),
                            borderSide: const BorderSide(
                                color: Colors.black54, width: 1),
                          ),
                          isCollapsed: true,
                          contentPadding:
                              const EdgeInsets.fromLTRB(12, 14, 12, 12),
                        ),
                      ),
                    ),
                    const SizedBox(width: defaultPadding / 2),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: defaultPadding,
                            horizontal: defaultPadding / 2),
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
            ),
            const Spacer(flex: 2),
          ],
        ),
        const SizedBox(height: defaultPadding),
        Container(
          padding: const EdgeInsets.all(defaultPadding / 2),
          decoration: BoxDecoration(
            // color: canvasColor,
            borderRadius: BorderRadius.circular(defaultPadding),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Row(
                  children: [
                    CustomText(
                      text: "รายการรับประกัน",
                      weight: FontWeight.bold,
                    ),
                  ],
                ),
                accentDividerTop,
                // Obx(() => ListView.separated(
                //       shrinkWrap: true,
                //       physics: const NeverScrollableScrollPhysics(),
                //       separatorBuilder: (_, __) =>
                //           Container(height: 1.5, color: Colors.grey[300]),
                //       itemCount: controller.dealerList.length,
                //       itemBuilder: (context, index) {
                //         return dealerDetailWidget(
                //           index,
                //           controller.dealerList[index],
                //           controller,
                //         );
                //       },
                //     )),
              ],
            ),
          ),
        ),
        const SizedBox(height: defaultPadding / 2),
      ],
    );
  }
}
