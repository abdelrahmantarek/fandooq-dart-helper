part of '../rate.dart';


class RateDiscount {

  final String code;

  final String name;

  final String amount;

  RateDiscount({
    required this.code,
    required this.name,
    required this.amount,
  });

  factory RateDiscount.fromJson(Map<String, dynamic> json) {
    return RateDiscount(
      code: json['code'],
      name: json['name'],
      amount: json['amount'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['name'] = name;
    data['amount'] = amount;
    return data;
  }

  // copyWith method
  RateDiscount copyWith({
    String? code,
    String? name,
    String? amount,
  }) {
    return RateDiscount(
      code: code ?? this.code,
      name: name ?? this.name,
      amount: amount ?? this.amount,
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