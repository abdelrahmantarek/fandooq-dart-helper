part of '../rate.dart';


class RateDiscount {

  final String code;

  final String name;

  final String amount;

  final String? currency;

  RateDiscount({
    required this.code,
    required this.name,
    required this.amount,
    this.currency,
  });

  factory RateDiscount.fromJson(dynamic json,{String? currency}) {
    return RateDiscount(
      code: json['code'],
      name: json['name'],
      amount: json['amount'],
      currency: json['currency'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['name'] = name;
    data['amount'] = amount;
    data['currency'] = currency;
    return data;
  }

  String toJsonCompress() {
    return [
      code,
      name,
      amount,
      currency
    ].join(",");
  }

  // copyWith method
  RateDiscount copyWith({
    String? code,
    String? name,
    String? amount,
    String? currency,
  }) {
    return RateDiscount(
      code: code ?? this.code,
      name: name ?? this.name,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
    );
  }

  String get getSubtitle{
    switch(code){
      case "PQ":
        return "";
      case "SDD":
        return "Enjoy a special discount available for a limited time.";
      case "NRF":
        return "Save more with our non-refundable discount. Please note, no refunds if canceled.";
    }
    return "";
  }

  @override
  int get hashCode => code.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is RateDiscount &&
              runtimeType == other.runtimeType &&
              code == other.code;

}

