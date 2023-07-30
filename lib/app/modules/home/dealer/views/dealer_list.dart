import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:warranty/app/api/api_end_points.dart';

import '../../../../api/api.dart';
import '../../../../data/response/dealer_response.dart';
import '../../../../shared/constant.dart';
import '../../../../shared/custom_text.dart';
import '../controllers/dealer_controller.dart';

class DealerList extends StatelessWidget {
  DealerList({super.key});

  final DealerController controller = Get.put(DealerController());
  final dealerCodeTextController = TextEditingController();

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
                      text: "รายชื่อร้านค้า",
                      weight: FontWeight.bold,
                    ),
                  ],
                ),
                accentDividerTop,
                Obx(() => ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (_, __) =>
                          Container(height: 1.5, color: Colors.grey[300]),
                      itemCount: controller.dealerList.length,
                      itemBuilder: (context, index) {
                        return dealerDetailWidget(
                            index, controller.dealerList[index]);
                      },
                    )),
              ],
            ),
          ),
        ),
        const SizedBox(height: defaultPadding / 2),
      ],
    );
  }
}

Widget dealerDetailWidget(int index, DealerSystemLink dealerData) {
  return Row(
    children: [
      Expanded(
        flex: 8,
        child: Container(
          padding: const EdgeInsets.all(defaultPadding / 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defaultPadding),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              QrImageView(
                data:
                    '${Api.baseUrlSystemLink}${ApiEndPoints.systemLinkDealers}/${dealerData.code}',
                version: QrVersions.auto,
                size: 128,
                gapless: false,
              ),
              Wrap(
                direction: Axis.vertical,
                children: [
                  Text(
                    "${dealerData.code} ",
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  Text(
                    "${dealerData.name} ",
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  Text(
                    "${dealerData.address}",
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  Text(
                    "${dealerData.phone}",
                  ),
                  const SizedBox(height: defaultPadding / 2),
                ],
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
