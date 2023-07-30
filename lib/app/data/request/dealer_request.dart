class DealerRequest {
  DealerRequest({
    required this.criteria,
    required this.limit,
  });
  late final Criteria criteria;
  late final int limit;

  DealerRequest.fromJson(Map<String, dynamic> json) {
    criteria = Criteria.fromJson(json['criteria']);
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['criteria'] = criteria.toJson();
    data['limit'] = limit;
    return data;
  }
}

class Criteria {
  Criteria({
    required this.dealerCode,
  });
  late final String dealerCode;

  Criteria.fromJson(Map<String, dynamic> json) {
    dealerCode = json['dealer_code'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['dealer_code'] = dealerCode;
    return data;
  }
}
