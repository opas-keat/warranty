class ProductServiceResponse {
  String? code;
  String? message;
  List<ProductData>? data;

  ProductServiceResponse({this.code, this.message, this.data});

  ProductServiceResponse.withError({
    code,
    String? msg,
  }) : message = msg;

  ProductServiceResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ProductData>[];
      json['data'].forEach((v) {
        data!.add(new ProductData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductData {
  String? id;
  String? productType;
  String? productBrand;
  int? productAmount;
  String? productStructureExpire;
  String? productColorExpire;
  String? productTireExpire;
  String? productMileExpire;
  String? productPromotionExpire;
  String? warrantyNo;
  String? promotion;
  int? promotionDay;
  int? promotionMile;
  int? warrantyWheelYear;
  int? warrantyWheelColor;
  int? warrantyTireYear;
  int? warrantyTireMile;
  int? warrantyTireYearZestino;
  int? warrantyTireMileZestino;

  ProductData(
      {this.id,
      this.productType,
      this.productBrand,
      this.productAmount,
      this.productStructureExpire,
      this.productColorExpire,
      this.productTireExpire,
      this.productMileExpire,
      this.productPromotionExpire,
      this.warrantyNo,
      this.promotion,
      this.promotionDay,
      this.promotionMile,
      this.warrantyWheelYear,
      this.warrantyWheelColor,
      this.warrantyTireYear,
      this.warrantyTireMile,
      this.warrantyTireYearZestino,
      this.warrantyTireMileZestino});

  ProductData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productType = json['product_type'];
    productBrand = json['product_brand'];
    productAmount = json['product_amount'];
    productStructureExpire = json['product_structure_expire'];
    productColorExpire = json['product_color_expire'];
    productTireExpire = json['product_tire_expire'];
    productMileExpire = json['product_mile_expire'];
    productPromotionExpire = json['product_promotion_expire'];
    warrantyNo = json['warranty_no'];
    promotion = json[':promotion'];
    promotionDay = json[':promotion_day'];
    promotionMile = json[':promotion_mile'];
    warrantyWheelYear = json[':warranty_wheel_year'];
    warrantyWheelColor = json[':warranty_wheel_color'];
    warrantyTireYear = json[':warranty_tire_year'];
    warrantyTireMile = json[':warranty_tire_mile'];
    warrantyTireYearZestino = json[':warranty_tire_year_zestino'];
    warrantyTireMileZestino = json[':warranty_tire_mile_zestino'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_type'] = this.productType;
    data['product_brand'] = this.productBrand;
    data['product_amount'] = this.productAmount;
    data['product_structure_expire'] = this.productStructureExpire;
    data['product_color_expire'] = this.productColorExpire;
    data['product_tire_expire'] = this.productTireExpire;
    data['product_mile_expire'] = this.productMileExpire;
    data['product_promotion_expire'] = this.productPromotionExpire;
    data['warranty_no'] = this.warrantyNo;
    data[':promotion'] = this.promotion;
    data[':promotion_day'] = this.promotionDay;
    data[':promotion_mile'] = this.promotionMile;
    data[':warranty_wheel_year'] = this.warrantyWheelYear;
    data[':warranty_wheel_color'] = this.warrantyWheelColor;
    data[':warranty_tire_year'] = this.warrantyTireYear;
    data[':warranty_tire_mile'] = this.warrantyTireMile;
    data[':warranty_tire_year_zestino'] = this.warrantyTireYearZestino;
    data[':warranty_tire_mile_zestino'] = this.warrantyTireMileZestino;
    return data;
  }
}
