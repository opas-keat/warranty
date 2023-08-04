import 'package:get/get.dart';
import 'package:warranty/app/shared/constant.dart';

import '../../../../api/api.dart';
import '../../../../api/api_end_points.dart';
import '../../../../api/services/dealer_service.dart';
import '../../../../data/response/dealer_response.dart';
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

  final dealerResponse = DealerSystemLinkResponse().obs;
  final dealerList = [].obs;




  Future<bool> listSystemLinkDealerByCode(String dealerCode) async {
    talker.info('$logTitle listSystemLinkDealerByCode');
    try {
      // dealerCode = "CL1713";
      dealerList.clear();
      final result =
          await DealerService().listSystemLinkDealerByCode(dealerCode);
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
    DealerSystemLink dealerData,
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
                  text: dealerData.code,
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
}
