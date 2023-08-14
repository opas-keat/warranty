import 'dart:convert';
import 'dart:html' as html;
import 'dart:ui';

import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:warranty/app/api/custom_log_interceptor.dart';
import 'package:warranty/app/shared/constant.dart';

import '../../../../api/api.dart';
import '../../../../api/api_end_points.dart';
import '../../../../api/services/system_link_service.dart';
import '../../../../data/response/dealer_system_link_response.dart';
import '../../../../shared/utils.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class DealerController extends GetxController {
  final logTitle = "DealerController";
  var isLoading = true.obs;

  RxString dealerCode = "".obs;
  final offset = 0.obs;
  final limit = 50.obs;

  RxBool checkedBKKRegion = false.obs;
  RxBool checkedCentralRegion = false.obs;
  RxBool checkedEastRegion = false.obs;
  RxBool checkedNorthEastRegion = false.obs;
  RxBool checkedNorthRegion = false.obs;
  RxBool checkedSouthernRegion = false.obs;
  RxBool checkedWestRegion = false.obs;

  RxString fTBKKRegion = "0".obs;
  RxString fTCentralRegion = "0".obs;
  RxString fTEastRegion = "0".obs;
  RxString fTNorthEastRegion = "0".obs;
  RxString fTNorthRegion = "0".obs;
  RxString fTSouthernRegion = "0".obs;
  RxString fTWestRegion = "0".obs;

  // final dealerResponse = DealerResponse().obs;
  final dealerList = [].obs;

  final dealerListNew = [].obs;

  Future<bool> listSystemLinkDealerByCode(String dealerCode) async {
    talker.info('$logTitle listSystemLinkDealerByCode');
    try {
      dealerCode = "";
      dealerList.clear();
      final result = await SystemLinkService().listDealerByCode(dealerCode);
      talker.debug('$result');
      dealerList.addAll(result!.data!.rows!);
      update();
      return true;
    } catch (e) {
      talker.error('$e');
      return false;
    }
  }

  /// create PDF & print it
  void printQrCode(
    DealerSystemLinkRows dealerData,
  ) async {
    final doc = pw.Document();
    // final font = await PdfGoogleFonts.notoSansThaiRegular();
    final font = await PdfGoogleFonts.sarabunRegular();

    /// for using an image from assets
    // final image = await imageFromAssetBundle('assets/image.png');

    doc.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.SizedBox(
                width: double.infinity,
                child: pw.Text(
                  dealerData.name.toString(),
                  style: pw.TextStyle(
                    font: font,
                    fontSize: 20,
                  ),
                ),
              ),
              pw.SizedBox(height: defaultPadding),
              pw.SizedBox(
                width: double.infinity,
                child: pw.Text(dealerData.address.toString(),
                    style: pw.TextStyle(
                      font: font,
                      fontSize: 16,
                    )),
              ),
              pw.SizedBox(height: defaultPadding),
              pw.SizedBox(
                width: double.infinity,
                child: pw.Text(dealerData.phone.toString(),
                    style: pw.TextStyle(
                      font: font,
                      fontSize: 16,
                    )),
              ),
              pw.SizedBox(height: 50),
              pw.Center(
                child: pw.BarcodeWidget(
                  drawText: true,
                  data:
                      '${Api.baseUrlSystemLink}${ApiEndPoints.systemLinkDealers}/${dealerData.code}',
                  width: 150,
                  height: 150,
                  barcode: pw.Barcode.qrCode(),
                ),
              ),
              pw.Center(
                child: pw.Paragraph(
                  text: dealerData.name.toString(),
                  style: pw.TextStyle(
                    font: font,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    ); // Page

    /// print the document using the iOS or Android print service:
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => doc.save());
    // return doc.save();

    /// share the document to other applications:
    // await Printing.sharePdf(bytes: await doc.save(), filename: 'my-document.pdf');

    /// tutorial for using path_provider: https://www.youtube.com/watch?v=fJtFDrjEvE8
    /// save PDF with Flutter library "path_provider":
    // final output = await getTemporaryDirectory();
    // final file = File('${output.path}/example.pdf');
    // await file.writeAsBytes(await doc.save());
  }

  Future downloadQrCode(
    DealerSystemLinkRows dealerData,
  ) async {
    talker.debug('$title:downloadQrCode');
    try {
      final image = await QrPainter(
        data:
            '${Api.baseUrlSystemLink}${ApiEndPoints.systemLinkDealers}/${dealerData.code}',
        version: QrVersions.auto,
      ).toImage(300);
      final a = await image.toByteData(format: ImageByteFormat.png);
      var bytes = a!.buffer.asUint8List();

      final base64 = base64Encode(bytes);
      final anchor = html.AnchorElement(
          href: 'data:application/octet-stream;base64,$base64')
        ..download = "image.png"
        ..target = 'blank';

      html.document.body!.append(anchor);
      anchor.click();
      anchor.remove();
    } catch (e) {
      talker.error('$title:downloadQrCode:$e');
      rethrow;
    }
  }

  Future<bool> addDealer() async {
    return false;
  }
}
