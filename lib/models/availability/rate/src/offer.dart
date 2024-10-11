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

  factory Offer.fromJson(dynamic json) {
    return Offer(
      code: json['code'],
      name: json['name'],
      amount: json['amount'],
    );
  }
  
  // copyWith method
  Offer copyWith({
    String? code,
    String? name,
    String? amount,
  }) {
    return Offer(
      code: code ?? this.code,
      name: name ?? this.name,
      amount: amount ?? this.amount,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['name'] = name;
    data['amount'] = amount;
    return data;
  }

  String toJsonCompress() {
    return [
      code,
      name,
      amount
    ].join(",");
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Offer) return false;
    return other.code == code && other.name == name;
  }

  @override
  int get hashCode => code.hashCode ^ name.hashCode;


  num get amountNumber{
    num amountToNumber(){
      var amountIn = num.parse((amount ?? "0").replaceAll(",", ""));
      int amountInCents = (amountIn * 100).toInt();
      return amountInCents;
    }
    var number = amountToNumber();
    return centsToCurrency(number).abs();
  }

  num centsToCurrency(num amountInCents) {
    double amount = amountInCents / 100;
    return amount;
  }


}
