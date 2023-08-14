import 'package:connectivity_plus/connectivity_plus.dart';

import '../../data/request/dealer_request.dart';
import '../../data/response/dealer_system_link_response.dart';
import '../../shared/utils.dart';
import '../api.dart';
import '../api_end_points.dart';
import '../api_params.dart';
import '../api_utils.dart';

class SystemLinkService {
  final title = "SystemLinkService";

  Future<DealerSystemLinkResponse?> listDealerByCode(
    String dealerCode,
  ) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return DealerSystemLinkResponse.withError(
          statusCode: httpStatusNoInternet, msg: apiUtils.getNetworkError());
    }

    try {
      final result = await apiUtils.post(
        url: '${Api.baseUrlSystemLink}${ApiEndPoints.systemLinkDealers}',
        data: DealerSystemLinkRequest(
          limit: 50,
          criteria: DealerSystemLinkCriteria(
            dealerCode: dealerCode,
          ),
        ).toJson(),
      );
      talker.debug('$title::listDealerByCode:: ${result.data['status_code']}');
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
