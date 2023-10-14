import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/response/warranty_customer_service_response.dart';
import '../../../../shared/constant.dart';
import '../../../../shared/custom_text.dart';
import '../../../../shared/header.dart';
import '../../../../shared/utils.dart';
import '../controllers/warranty_controller.dart';

class WarrantyList extends StatelessWidget {
  const WarrantyList({super.key});

  @override
  Widget build(BuildContext context) {
    final WarrantyController controller = Get.put(WarrantyController());
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
          Row(
            children: [
              const Expanded(
                child: CustomText(
                  text: "รายละเอียดลูกค้า",
                  weight: FontWeight.bold,
                  scale: 1.5,
                ),
              ),
              Obx(
                () => CustomText(
                  text: "จำนวน : ${controller.customerList.length} รายการ",
                  scale: 1.2,
                ),
              ),
            ],
          ),
          accentDividerTop,
          // customerDetail(),
          Expanded(
            child: Obx(
              () => DataTable2(
                columnSpacing: defaultPadding,
                dividerThickness: 2,
                showBottomBorder: true,
                showCheckboxColumn: false,
                headingRowColor: MaterialStateProperty.resolveWith(
                    (states) => Colors.grey.shade200),
                columns: listColumn,
                rows: List.generate(
                  controller.customerList.length,
                  (index) => setDataRow(
                    index,
                    controller.customerList[index],
                    controller,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          Row(
            children: [
              const Expanded(
                child: CustomText(
                  text: "รายการรับประกัน",
                  weight: FontWeight.bold,
                  scale: 1.5,
                ),
              ),
              Obx(
                () => CustomText(
                  text: "จำนวน : ${controller.warrantyList.length} รายการ",
                  scale: 1.2,
                ),
              ),
            ],
          ),
          accentDividerTop,
          Expanded(
            flex: 3,
            child: Obx(
              () => ListView.builder(
                shrinkWrap: true,
                itemCount: controller.warrantyList.length,
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
                              padding: const EdgeInsets.only(
                                  top: defaultPadding / 2),
                              child: Wrap(
                                alignment: WrapAlignment.spaceBetween,
                                spacing: defaultPadding / 2,
                                children: [
                                  Wrap(
                                    children: [
                                      CustomText(
                                        text:
                                            "เลขที่ใบรับประกัน : ${controller.warrantyList[index].receiveNo}",
                                        scale: 1.8,
                                      ),
                                      const SizedBox(width: defaultPadding),
                                      const CustomText(
                                        text: "รูปรถ ",
                                        scale: 1.8,
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.image_sharp,
                                        ),
                                        color: primaryColor,
                                      ),
                                      const SizedBox(width: defaultPadding),
                                      const CustomText(
                                        text: "รูปใบเสร็จ ",
                                        scale: 1.8,
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
                                  CustomText(
                                    text:
                                        "วันที่ซื้อสินค้า : ${controller.warrantyList[index].receiveDate}",
                                    scale: 1.5,
                                  ),
                                ],
                              ),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(
                                bottom: defaultPadding / 2,
                              ),
                              child: Wrap(
                                alignment: WrapAlignment.end,
                                spacing: defaultPadding / 2,
                                children: [
                                  CustomText(
                                    text:
                                        "รหัสร้านค้า : ${controller.warrantyList[index].dealerCode}",
                                    scale: 1.2,
                                  ),
                                  CustomText(
                                    text:
                                        "ชื่อร้านค้า : ${controller.warrantyList[index].dealerName}",
                                    scale: 1.2,
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
                            scale: 1.2,
                          ),
                        ),
                        Column(
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              itemCount: controller
                                  .warrantyList[index].products!.length,
                              itemBuilder: (context, index2) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: defaultPadding / 2,
                                    horizontal: defaultPadding,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                        text:
                                            "${index2 + 1}. ${controller.warrantyList[index].products![index2].type} : ${controller.warrantyList[index].products![index2].detail} ",
                                        scale: 1.2,
                                      ),
                                      CustomText(
                                        text:
                                            "จำนวน : ${controller.warrantyList[index].products![index2].amount}",
                                        scale: 1.2,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: defaultPadding),
                      ],
                    ),
                  );
                },
              ),
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

List<DataColumn> listColumn = [
  const DataColumn2(
    label: CustomText(text: "ลำดับ", scale: 0.9),
    fixedWidth: 50,
  ),
  const DataColumn2(
    label: CustomText(text: "หมายเลขโทรศัพท์", scale: 0.9),
    size: ColumnSize.M,
  ),
  const DataColumn2(
    label: CustomText(text: "ชื่อ-นามสกุล", scale: 0.9),
    size: ColumnSize.M,
  ),
  const DataColumn2(
    label: CustomText(text: "ทะเบียนรถ", scale: 0.9),
    size: ColumnSize.S,
  ),
  const DataColumn2(
    label: CustomText(text: "EMAIL", scale: 0.9),
    size: ColumnSize.S,
  ),
];

DataRow setDataRow(
  int index,
  WarrantyCustomerData warrantyCustomerData,
  WarrantyController controller,
) {
  return DataRow.byIndex(
    index: index + 1,
    // color: MaterialStateProperty.resolveWith(
    //   (states) {
    //     if ((index) == controller.selectedIndexFromTable) {
    //       return Colors.amber.shade200;
    //     } else if (index % 2 == 0) {
    //       return Colors.blue[50];
    //     } else {
    //       return Colors.white;
    //     }
    //   },
    // ),
    onSelectChanged: (value) async {
      // controller.selectDataFromTable(index);
      // controller.selectDataFromTable(index, warrantyCustomerData.id!);
      Get.dialog(
        const Center(
          child: CircularProgressIndicator(),
        ),
        barrierDismissible: false,
      );
      await controller.selectDataFromTable(index, warrantyCustomerData.id!);
      Get.back();
    },
    cells: [
      DataCell(
        CustomText(text: formatterItem.format(index + 1)),
      ),
      DataCell(
        Wrap(
          children: [
            CustomText(text: warrantyCustomerData.telephone!),
          ],
        ),
      ),
      DataCell(
        Wrap(
          children: [
            CustomText(text: warrantyCustomerData.fullName!),
          ],
        ),
      ),
      DataCell(
        Wrap(
          children: [
            CustomText(text: warrantyCustomerData.licensePlate!),
          ],
        ),
      ),
      DataCell(
        Wrap(
          children: [
            CustomText(text: warrantyCustomerData.email!),
          ],
        ),
      ),
    ],
  );
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

  final WarrantyController controller = Get.find<WarrantyController>();

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
              onPressed: () async {
                Get.dialog(
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                  barrierDismissible: false,
                );
                await controller.searchData();
                Get.back();
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
              onPressed: () async {
                Get.dialog(
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                  barrierDismissible: false,
                );
                await controller.searchData();
                Get.back();
              },
            ),
            const SizedBox(width: defaultPadding / 2),
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
              onPressed: () async {
                Get.dialog(
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                  barrierDismissible: false,
                );
                await controller.searchData();
                Get.back();
              },
            ),
            const SizedBox(width: defaultPadding / 2),
          ],
        ),
      ),
    );
  }
}
