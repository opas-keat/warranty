class CustomerServiceResponse {
  String? code;
  String? message;
  List<CustomerData>? data;

  CustomerServiceResponse({this.code, this.message, this.data});

  CustomerServiceResponse.withError({
    code,
    String? msg,
  }) : message = msg;

  CustomerServiceResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CustomerData>[];
      json['data'].forEach((v) {
        data!.add(new CustomerData.fromJson(v));
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

class CustomerData {
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
  Null? products;

  CustomerData(
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

  CustomerData.fromJson(Map<String, dynamic> json) {
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
    products = json['products'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['warranty_no'] = this.warrantyNo;
    data['warranty_date'] = this.warrantyDate;
    data['dealer_code'] = this.dealerCode;
    data['dealer_name'] = this.dealerName;
    data['customer_name'] = this.customerName;
    data['customer_phone'] = this.customerPhone;
    data['customer_license_plate'] = this.customerLicensePlate;
    data['customer_email'] = this.customerEmail;
    data['customer_mile'] = this.customerMile;
    data['products'] = this.products;
    return data;
  }
}
