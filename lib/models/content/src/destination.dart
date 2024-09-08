part of '../hotel.dart';


class Destination {
  

  final String code;


  final String countryCode;


  final List<GroupZone> groupZones;


  final String isoCode;


  final ContentAndLanguage name;


  final List<ZoneD> zones;

  Destination({
    required this.code,
    required this.countryCode,
    required this.groupZones,
    required this.isoCode,
    required this.name,
    required this.zones,
  });

  factory Destination.fromJson(dynamic json) {
    return Destination(
      code: json['code'] as String,
      countryCode: json['countryCode'] as String,
      groupZones: (json['groupZones'] as List).map((e) => GroupZone.fromJson(e)).toList(),
      isoCode: json['isoCode'] as String,
      name: ContentAndLanguage.fromJson(json['name'] as Map<String, dynamic>),
      zones: (json['zones'] as List).map((e) => ZoneD.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'countryCode': countryCode,
      'groupZones': groupZones.map((e) => e.toJson()).toList(),
      'isoCode': isoCode,
      'name': name.toJson(),
      'zones': zones.map((e) => e.toJson()).toList(),
    };
  }

  Destination copyWith({
    String? code,
    String? countryCode,
    List<GroupZone>? groupZones,
    String? isoCode,
    ContentAndLanguage? name,
    List<ZoneD>? zones,
  }) {
    return Destination(
      code: code ?? this.code,
      countryCode: countryCode ?? this.countryCode,
      groupZones: groupZones ?? this.groupZones,
      isoCode: isoCode ?? this.isoCode,
      name: name ?? this.name,
      zones: zones ?? this.zones,
    );
  }

  @override
  int get hashCode => code.hashCode ^ countryCode.hashCode ^ groupZones.hashCode ^ isoCode.hashCode ^ name.hashCode ^ zones.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Destination &&
        other.code == code &&
        other.countryCode == countryCode &&
        other.isoCode == isoCode &&
        other.name == name;
  }
}

class GroupZone {
  final String groupZoneCode;
  final ContentAndLanguage name;
  final List<int> zones;

  GroupZone({
    required this.groupZoneCode,
    required this.name,
    required this.zones,
  });

  factory GroupZone.fromJson(dynamic json) {
    return GroupZone(
      groupZoneCode: json['groupZoneCode'] as String,
      name: ContentAndLanguage.fromJson(json['name'] as Map<String, dynamic>),
      zones: List<int>.from(json['zones']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'groupZoneCode': groupZoneCode,
      'name': name.toJson(),
      'zones': zones,
    };
  }

// Implement copyWith, hashCode, and operator == methods
}


