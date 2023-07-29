import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/constant.dart';
import '../../../../shared/custom_text.dart';

class DealerLayoutLarge extends StatelessWidget {
  const DealerLayoutLarge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 10,
          child: Container(
            color: Colors.amberAccent,
            child: Column(
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(flex: 1),
                    const CustomText(
                      text: "รหัสร้านค้า",
                      weight: FontWeight.bold,
                      size: 18,
                    ),
                    const SizedBox(width: defaultPadding / 2),
                    Expanded(
                      child: TextFormField(
                        // controller: controller.tffName,
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
                      onPressed: () {},
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
                    ),
                    const SizedBox(width: defaultPadding / 2),
                    // ElevatedButton.icon(
                    //   icon: const Icon(
                    //     Icons.add_sharp,
                    //   ),
                    //   label: const CustomText(
                    //     text: "เพิ่ม",
                    //     color: Colors.white,
                    //   ),
                    //   style: ElevatedButton.styleFrom(
                    //     padding: const EdgeInsets.symmetric(
                    //       vertical: defaultPadding,
                    //       horizontal: defaultPadding / 2,
                    //     ),
                    //   ),
                    //   onPressed: () {
                    //     // Get.toNamed(Routes.MANAGE_STATION);
                    //   },
                    // ),
                    const Spacer(flex: 1),
                  ],
                ),
                // const SizedBox(height: defaultPadding / 2),
                // InfoCard(
                //   childAspectRatio: 2.2,
                //   listSummaryInfo: listDashboardSummaryInfo,
                //   textScale: 1.4,
                // ),
                // const SizedBox(height: defaultPadding / 2),
                // StationStatistics(),
              ],
            ),
          ),
        ),
        // Expanded(
        //   child: Padding(
        //     padding: const EdgeInsets.only(left: defaultPadding / 2),
        //     child: MainChart(
        //       header: "สถิติข้อมูลการอบรมของ ศส.ปชต.",
        //       subHeader: "ประเภทการอบรม",
        //       listSummaryChart: summaryDashboardChart,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
