
part of '../rate.dart';

class CancellationPolicy {

  final String? amount;

  final String? from;

  CancellationPolicy({this.amount, this.from});

  CancellationPolicy.fromJson(dynamic json)
      : amount = json['amount'],
        from = json['from'];

  Map<String, dynamic> toJson({num commission = 0}) => {
    'amount': Consts.commission(num.parse(amount ?? "0"),commission).toString(),
    'from': from,
  };

  String toJsonCompress({num commission = 0}) {
    return [
          Consts.commission(num.parse(amount ?? "0"),commission).toString(),
          from,
        ].join(",");
  }

  CancellationPolicy copyWith({
    String? amount,
    String? from,
  }) {
    return CancellationPolicy(
      amount: amount ?? this.amount,
      from: from ?? this.from,
    );
  }

  DateTime get date {
    return DateTime.parse(from ?? "").toLocal();
  }

  bool get hasFreeCancellation{
    return date.isAfter(DateTime.now());
  }

  bool get nonRefund {
    return !hasFreeCancellation;
  }


  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CancellationPolicy &&
        other.amount == amount &&
        other.from == from;
  }

  @override
  int get hashCode => amount.hashCode ^ from.hashCode;
}