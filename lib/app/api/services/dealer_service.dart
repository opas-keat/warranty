import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:warranty/app/api/api_params.dart';

import '../../data/request/dealer_request.dart';
import '../../data/response/dealer_response.dart';
import '../../shared/utils.dart';
import '../api.dart';
import '../api_end_points.dart';
import '../api_utils.dart';

class DealerService {
  final title = "DealerService";

  Future<DealerSystemLinkResponse?> listSystemLinkDealerByCode(
    String dealerCode,
  ) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return DealerSystemLinkResponse.withError(
          statusCode: httpStatusNoInternet, msg: apiUtils.getNetworkError());
    }

    String url = '${Api.baseUrlSystemLink}${ApiEndPoints.systemLinkDealers}';
    try {
      final result = await apiUtils.post(
        url: url,
        data: DealerSystemLinkRequest(
          limit: 50,
          criteria: DealerSystemLinkCriteria(
            dealerCode: dealerCode,
          ),
        ).toJson(),
      );
      talker.debug(
          '$title::listSystemLinkDealerByCode:: ${result.data['status_code']}');
      if (result.data['status_code'] == 200) {
        return DealerSystemLinkResponse.fromJson(result.data);
      }
      return DealerSystemLinkResponse.withError(
          statusCode: httpStatusResponseNull, msg: "");
    } catch (e) {
      return DealerSystemLinkResponse.withError(
          statusCode: httpStatusError, msg: apiUtils.handleError(e));
    }
  }
}
