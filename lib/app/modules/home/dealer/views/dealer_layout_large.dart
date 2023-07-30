import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/constant.dart';
import '../../../../shared/custom_text.dart';
import '../controllers/dealer_controller.dart';

class DealerLayoutLarge extends StatelessWidget {
  DealerLayoutLarge({
    super.key,
  });

  final DealerController controller = Get.put(DealerController());
  final dealerCodeTextController = TextEditingController();

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
                        controller: dealerCodeTextController,
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
                        controller.listSystemLinkDealerByCode(
                          dealerCodeTextController.text,
                        );
                      },
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
                const SizedBox(height: defaultPadding),
                Row(
                  children: [
                    CustomText(
                      text: 'รายชื่อร้านค้า',
                    ),
                    const SizedBox(height: defaultPadding),
                  ],
                ),

                // const SizedBox(height: defaultPadding),
                // Container(
                //   color: Colors.blue,
                //   padding: const EdgeInsets.all(defaultPadding / 2),
                //   decoration: BoxDecoration(
                //     color: canvasColor,
                //     borderRadius: BorderRadius.circular(defaultPadding),
                //   ),
                //   child: SingleChildScrollView(
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       mainAxisSize: MainAxisSize.max,
                //       children: [
                //         const Row(
                //           children: [
                //             CustomText(
                //               text: "ข้อมูลสถิติรายจังหวัด",
                //               weight: FontWeight.bold,
                //             ),
                //           ],
                //         ),
                //         accentDivider,
                //         // ListView.builder(
                //         //   shrinkWrap: true,
                //         //   physics: const NeverScrollableScrollPhysics(),
                //         //   itemCount: listStationStatisticsData.length,
                //         //   itemBuilder: (context, index) {
                //         //     return DashboardStatisticsSmallRow(
                //         //         index, listStationStatisticsData[index]);
                //         //   },
                //         // ),
                //       ],
                //     ),
                //   ),
                // ),
                // Expanded(
                //   child: Obx(() => ListView.separated(
                //         separatorBuilder: (context, index) =>
                //             const SizedBox(height: defaultPadding / 4),
                //         shrinkWrap: true,
                //         physics: const BouncingScrollPhysics(),
                //         itemCount:
                //             controller.dealerList.value.data!.totalCount!,
                //         itemBuilder: (context, index) {
                //           return Material(
                //             color: Colors.grey.shade200,
                //             child: ListTile(
                //               // onTap: () async {
                //               //   final result = await controller.addShipping(
                //               //     controller.shippingList.value[index].id
                //               //         .toString(),
                //               //     controller.shippingList.value[index].name
                //               //         .toString(),
                //               //   );
                //               //   Get.back();
                //               // },
                //               selectedColor: primaryColor,
                //               selectedTileColor: primaryColor,
                //               title: CustomText(
                //                 text: controller
                //                     .dealerList.value.data!.rows![index].name,
                //               ),
                //             ),
                //           );
                //         },
                //       )),
                // ),
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
