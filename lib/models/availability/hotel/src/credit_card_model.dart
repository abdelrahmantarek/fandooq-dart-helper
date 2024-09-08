part of '../hotel.dart';


class CreditCardModel {

  final String? code;

  final String? name;

  final String? paymentType;

  CreditCardModel({this.code, this.name, this.paymentType});

  CreditCardModel.fromJson(dynamic json)
      : code = json['code'],
        name = json['name'],
        paymentType = json['paymentType'];

  Map<String, dynamic> toJson() => {
        'code': code,
        'name': name,
        'paymentType': paymentType,
      };

  CreditCardModel copyWith({
    String? code,
    String? name,
    String? paymentType,
  }) {
    return CreditCardModel(
      code: code ?? this.code,
      name: name ?? this.name,
      paymentType: paymentType ?? this.paymentType,
    );
  }

}
