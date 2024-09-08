part of '../hotel.dart';


class ZoneD {
  final ContentAndLanguage? description;
  final String? name;
  final int? zoneCode;

  ZoneD({
     this.description,
     this.name,
     this.zoneCode,
  });

  factory ZoneD.fromJson(dynamic json) {
    return ZoneD(
      description: ContentAndLanguage.fromJson(json['description'] as Map<String, dynamic>),
      name: json['name'] as String,
      zoneCode: json['zoneCode'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description?.toJson(),
      'name': name,
      'zoneCode': zoneCode,
    };
  }

// Implement copyWith, hashCode, and operator == methods
}