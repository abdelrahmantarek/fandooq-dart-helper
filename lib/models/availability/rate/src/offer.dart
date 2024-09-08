part of '../rate.dart';


class Offer {

  final String? code;

  final String? name;

  final String? amount;

  Offer({
    this.code,
    this.name,
    this.amount,
  });

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
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
}
