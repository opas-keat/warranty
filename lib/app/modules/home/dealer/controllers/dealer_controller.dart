import 'package:get/get.dart';

import '../../../../api/services/dealer_service.dart';
import '../../../../data/response/dealer_response.dart';
import '../../../../shared/utils.dart';

class DealerController extends GetxController {
  final logTitle = "DealerController";
  var isLoading = true.obs;

  RxString dealerCode = "".obs;
  final offset = 0.obs;
  final limit = 50.obs;

  final dealerResponse = DealerSystemLinkResponse().obs;
  final dealerList = [].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<bool> listSystemLinkDealerByCode(String dealerCode) async {
    talker.info('$logTitle listSystemLinkDealerByCode');
    try {
      dealerCode = "CL1713";
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
}
