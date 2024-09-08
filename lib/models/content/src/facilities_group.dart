
part of '../hotel.dart';


class FacilitiesGroup {

  final int? code;
  final String? name;
  final String? icon;

  FacilitiesGroup({
    this.code,
    this.name,
    this.icon,
  });

  factory FacilitiesGroup.fromJson(dynamic json) {
    return FacilitiesGroup(
      code: json['code'],
      name: json['description']["content"],
      icon: json['icon'],
    );
  }

  @override
  int get hashCode => code.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FacilitiesGroup &&
        other.code == code;
  }


}

