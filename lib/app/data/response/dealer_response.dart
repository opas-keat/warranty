class DealerResponse {
  DealerResponse({
    required this.statusCode,
    required this.code,
    required this.message,
    required this.dealers,
  });
  late final int statusCode;
  late final String code;
  late final String message;
  late final Dealers dealers;

  DealerResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    code = json['code'];
    message = json['message'];
    dealers = Dealers.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status_code'] = statusCode;
    _data['code'] = code;
    _data['message'] = message;
    _data['data'] = dealers.toJson();
    return _data;
  }
}

class Dealers {
  Dealers({
    required this.dealer,
    required this.totalCount,
  });
  late final List<Dealer> dealer;
  late final int totalCount;

  Dealers.fromJson(Map<String, dynamic> json) {
    dealer = List.from(json['rows']).map((e) => Dealer.fromJson(e)).toList();
    totalCount = json['total_count'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['rows'] = dealer.map((e) => e.toJson()).toList();
    _data['total_count'] = totalCount;
    return _data;
  }
}

class Dealer {
  Dealer({
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

  Dealer.fromJson(Map<String, dynamic> json) {
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
