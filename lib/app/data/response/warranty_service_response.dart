class WarrantyServiceResponse {
  String? code;
  String? message;
  WarrantyData? data;

  WarrantyServiceResponse({this.code, this.message, this.data});

  WarrantyServiceResponse.withError({
    code,
    String? msg,
  }) : message = msg;

  WarrantyServiceResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? WarrantyData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class WarrantyData {
  String? id;
  String? warrantyNo;
  String? warrantyDate;
  String? dealerCode;
  String? dealerName;
  String? customerName;
  String? customerPhone;
  String? customerLicensePlate;
  String? customerEmail;
  String? customerMile;
  List<Products>? products;

  WarrantyData(
      {this.id,
      this.warrantyNo,
      this.warrantyDate,
      this.dealerCode,
      this.dealerName,
      this.customerName,
      this.customerPhone,
      this.customerLicensePlate,
      this.customerEmail,
      this.customerMile,
      this.products});

  WarrantyData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    warrantyNo = json['warranty_no'];
    warrantyDate = json['warranty_date'];
    dealerCode = json['dealer_code'];
    dealerName = json['dealer_name'];
    customerName = json['customer_name'];
    customerPhone = json['customer_phone'];
    customerLicensePlate = json['customer_license_plate'];
    customerEmail = json['customer_email'];
    customerMile = json['customer_mile'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['warranty_no'] = warrantyNo;
    data['warranty_date'] = warrantyDate;
    data['dealer_code'] = dealerCode;
    data['dealer_name'] = dealerName;
    data['customer_name'] = customerName;
    data['customer_phone'] = customerPhone;
    data['customer_license_plate'] = customerLicensePlate;
    data['customer_email'] = customerEmail;
    data['customer_mile'] = customerMile;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String? id;
  String? productType;
  String? productBrand;
  int? productAmount;
  String? warrantyNo;

  Products(
      {this.id,
      this.productType,
      this.productBrand,
      this.productAmount,
      this.warrantyNo});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productType = json['product_type'];
    productBrand = json['product_brand'];
    productAmount = json['product_amount'];
    warrantyNo = json['warranty_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_type'] = productType;
    data['product_brand'] = productBrand;
    data['product_amount'] = productAmount;
    data['warranty_no'] = warrantyNo;
    return data;
  }
}
