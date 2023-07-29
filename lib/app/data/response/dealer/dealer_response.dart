class DealerResponse {
  DealerResponse({
    required this.statusCode,
    required this.code,
    required this.message,
    required this.data,
  });
  late final int statusCode;
  late final String code;
  late final String message;
  late final Data data;

  DealerResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    code = json['code'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status_code'] = statusCode;
    _data['code'] = code;
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.code,
    required this.name,
    required this.address,
    required this.phone,
  });
  late final String id;
  late final String code;
  late final String name;
  late final String address;
  late final String phone;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['code'] = code;
    _data['name'] = name;
    _data['address'] = address;
    _data['phone'] = phone;
    return _data;
  }
}
