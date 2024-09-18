
part of '../rate.dart';



class RateBreakDown {

  final List<RateDiscount>? rateDiscounts;

  RateBreakDown({
    this.rateDiscounts,
  });

  factory RateBreakDown.fromJson(dynamic json) {
    return RateBreakDown(
      rateDiscounts: (json['rateDiscounts'] as List<dynamic>?)
          ?.map((v) => RateDiscount.fromJson(v))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (rateDiscounts != null) {
      data['rateDiscounts'] = rateDiscounts!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  String toJsonCompress() {
    return [
      rateDiscounts?.map((v) => v.toJsonCompress()).toRed("RateBreakDown")
    ].join(",");
  }


}
