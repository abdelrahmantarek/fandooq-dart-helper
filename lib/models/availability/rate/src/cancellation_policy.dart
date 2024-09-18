
part of '../rate.dart';

class CancellationPolicy {

  final String? amount;

  final String? from;

  CancellationPolicy({this.amount, this.from});

  CancellationPolicy.fromJson(dynamic json)
      : amount = json['amount'],
        from = json['from'];

  Map<String, dynamic> toJson() => {
    'amount': amount,
    'from': from,
  };

  String toJsonCompress() {
    return [
          amount,
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
    return DateTime.parse(from ?? "");
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