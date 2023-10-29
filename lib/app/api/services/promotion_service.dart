import 'dart:convert';

import 'package:dio/dio.dart';
import '../../data/response/promotion_service_response.dart';
import '../../shared/utils.dart';
import '../api.dart';
import '../api_end_points.dart';
import '../api_utils.dart';

class PromotionService {
  final title = "PromotionService";

  Future<PromotionServiceResponse?> list(
    Map<String, String> qParams,
  ) async {
    try {
      final response = await apiUtils.get(
        url: Api.baseUrl +
            Api.apiContext +
            Api.apiVersion +
            ApiEndPoints.promotion,
        queryParameters: qParams,
        options: Options(
          headers: apiUtils.secureHeaders,
        ),
      );
      PromotionServiceResponse promotionServiceResponse =
          PromotionServiceResponse.fromJson(jsonDecode(response.toString()));
      return promotionServiceResponse;
    } catch (e) {
      talker.error(e);
    }
    return null;
  }
}
