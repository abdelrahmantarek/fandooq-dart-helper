
part of '../rate.dart';

class Taxes {
  final List<Tax> taxes;
  final bool allIncluded;

  Taxes({
    required this.taxes,
    required this.allIncluded,
  });

  factory Taxes.fromJson(dynamic json) => Taxes(
    taxes: List<Tax>.from(json['taxes'].map((x) => Tax.fromJson(x))),
    allIncluded: json['allIncluded'],
  );

  Map<String, dynamic> toJson() => {
    'taxes': List<dynamic>.from(taxes.map((x) => x.toJson())),
    'allIncluded': allIncluded,
  };

  Taxes copyWith({
    List<Tax>? taxes,
    bool? allIncluded,
  }) =>
      Taxes(
        taxes: taxes ?? this.taxes,
        allIncluded: allIncluded ?? this.allIncluded,
      );

  @override
  String toString() => 'Taxes(taxes: $taxes, allIncluded: $allIncluded)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    Function eq = const ListEquality().equals;
    return other is Taxes &&
        eq(other.taxes, taxes) &&
        other.allIncluded == allIncluded;
  }

  @override
  int get hashCode => taxes.hashCode ^ allIncluded.hashCode;


}

class Tax {

  bool included;
  num amount;
  String currency;
  String? type;
  String? subType;
  num? clientAmount;
  String? clientCurrency;

  Tax({
    required this.included,
    required this.amount,
    required this.currency,
    required this.type,
    required this.subType,
    required this.clientAmount,
    required this.clientCurrency,
  });

  factory Tax.fromJson(dynamic json){
    return Tax(
      included: json['included'],
      amount: json['amount'].toString().beNum,
      currency: json['currency'],
      type: json['type'],
      subType: json['subType'],
      clientAmount: 0,
      clientCurrency: json['clientCurrency']
      // clientAmount: json['clientAmount'].toString().beNum,
      // clientCurrency: json['clientCurrency'],
    );
  }



  Map<String, dynamic> toJson() => {
    'included': included,
    'amount': amount,
    'currency': currency,
    'type': type,
    'subType': subType,
    'clientAmount': clientAmount,
    'clientCurrency': clientCurrency,
  };

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Tax &&
        other.type == type &&
        other.subType == subType;
  }

  @override
  int get hashCode => Object.hash(
      type,
      subType,
  );

  @override
  String toString() {
    return 'Fee(included: $included, amount: $amount, currency: $currency, type: $type, subType: $subType, clientAmount: $clientAmount, clientCurrency: $clientCurrency)';
  }

  String getName({num? amount}) {
    return subType ?? "estimated taxes and fees for this booking $amount $currency payable on arrival";
  }

}

extension StringE on dynamic{

  String join(String text){
    return this + text;
  }

  num get beNum{
    if(this == null){
      return 0;
    }
    if(this is String){

      if(toString().isEmpty){
        return 0;
      }

      return num.parse(this);
    }
    return this;
  }

}
