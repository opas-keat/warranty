import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../api/api_params.dart';
import '../../../../api/services/config_service.dart';
import '../../../../api/services/promotion_service.dart';
import '../../../../data/request/config_service_request.dart';
import '../../../../data/request/promotion_service_request.dart';
import '../../../../shared/utils.dart';

class ConfigController extends GetxController {
  final logTitle = "ConfigController";
  var isLoading = true.obs;

  final offset = 0.obs;
  final limit = 50.obs;

  final configs = <Configs>[].obs;

  final configWarrantyWheelColor = TextEditingController();
  final configWarrantyTireMileZestino = TextEditingController();
  final configWarrantyTireYear = TextEditingController();
  final configWarrantyTireYearZestino = TextEditingController();
  final configWarrantyPromotionTire = TextEditingController();
  final configWarrantyTireMile = TextEditingController();
  final configWarrantyWheelYear = TextEditingController();

  final promotionType = <String>["wheel", "tire"].obs;
  final promotionStatus = <String>["active", "inactive"].obs;

  final promotionList = <Promotions>[].obs;

  @override
  void onInit() {
    super.onInit();
    talker.info('$logTitle:onInit:');
    listConfig();
    listPromotion();
    isLoading.value = false;
  }

  @override
  void onReady() {
    talker.info('$logTitle:onReady:');
    super.onReady();
  }

  @override
  void onClose() {
    talker.info('$logTitle:onClose:');
    super.onClose();
  }

  listConfig() async {
    talker.info('$logTitle:listConfig:');
    isLoading.value = true;
    Map<String, String> qParams = {
      "offset": offset.value.toString(),
      "limit": queryParamLimit,
      "order": queryParamOrderBy,
    };
    try {
      final response = await ConfigService().list(qParams);
      for (final item in response!.data!) {
        if (item.configCode == "WarrantyWheelColor") {
          configWarrantyWheelColor.text = item.configValue!;
        }
        if (item.configCode == "WarrantyTireMileZestino") {
          configWarrantyTireMileZestino.text = item.configValue!;
        }
        if (item.configCode == "WarrantyTireYear") {
          configWarrantyTireYear.text = item.configValue!;
        }
        if (item.configCode == "WarrantyTireYearZestino") {
          configWarrantyTireYearZestino.text = item.configValue!;
        }
        if (item.configCode == "WarrantyPromotionTire") {
          configWarrantyPromotionTire.text = item.configValue!;
        }
        if (item.configCode == "WarrantyTireMile") {
          configWarrantyTireMile.text = item.configValue!;
        }
        if (item.configCode == "WarrantyWheelYear") {
          configWarrantyWheelYear.text = item.configValue!;
        }
        // if (item.configCode == "Campange") {
        //   configCampange.text = item.configValue!;
        // }
      }
      isLoading.value = false;
    } catch (e) {
      talker.error('$e');
    }
  }

  updateConfig(
    String configCode,
    String configValue,
  ) async {
    talker.info('$logTitle:updateConfig:');
    isLoading.value = true;
    try {
      configs.add(
        Configs(
          configCode: configCode,
          configValue: configValue,
        ),
      );
      final response = await ConfigService().update(configs.obs.value);
      talker.debug('response message : ${response?.message}');
      if (response?.code == "000") {
        // for (final item in response!.data!) {
        if (configCode == "WarrantyWheelColor") {
          configWarrantyWheelColor.text = configValue;
        }
        if (configCode == "WarrantyTireMileZestino") {
          configWarrantyTireMileZestino.text = configValue;
        }
        if (configCode == "WarrantyTireYear") {
          configWarrantyTireYear.text = configValue;
        }
        if (configCode == "WarrantyTireYearZestino") {
          configWarrantyTireYearZestino.text = configValue;
        }
        if (configCode == "WarrantyPromotionTire") {
          configWarrantyPromotionTire.text = configValue;
        }
        if (configCode == "WarrantyTireMile") {
          configWarrantyTireMile.text = configValue;
        }
        if (configCode == "WarrantyWheelYear") {
          configWarrantyWheelYear.text = configValue;
        }
      }
      isLoading.value = false;
      update();
      configs.clear();
      return true;
    } catch (e) {
      talker.error('$e');
      return false;
    }
  }

  listPromotion() async {
    talker.info('$logTitle:listPromotion:');
    isLoading.value = true;
    Map<String, String> qParams = {
      "offset": offset.value.toString(),
      "limit": queryParamLimit,
      "order": "promotion_status asc,promotion_type desc",
    };
    try {
      final response = await PromotionService().list(qParams);
      if (response?.code == "000") {
        for (final item in response!.data!) {
          talker.debug('promotionDetail : ${item.promotionDetail}');
          promotionList.add(Promotions(
            id: item.id,
            promotionStatus: item.promotionStatus,
            promotionType: item.promotionType,
            promotionBrand: item.promotionBrand,
            promotionDetail: item.promotionDetail,
            promotionWarrantyDay: item.promotionWarrantyDay,
            promotionFrom: item.promotionFrom,
            promotionTo: item.promotionTo,
          ));
        }
      }
      isLoading.value = false;
    } catch (e) {
      talker.error('$e');
    }
  }

  updatePromotion(Promotions promotion) {
    talker.debug('updatePromotion : ${promotion.id}');
    talker.debug('updatePromotion : ${promotion.promotionDetail}');
  }

  deletePromotion(Promotions promotion) {
    talker.debug('deletePromotion : ${promotion.id}');
    talker.debug('deletePromotion : ${promotion.promotionDetail}');
  }
}
