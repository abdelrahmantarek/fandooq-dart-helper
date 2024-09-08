part of '../hotel.dart';


class Terminal {

  final ContentAndLanguage? description;


  final int distance;


  final ContentAndLanguage? name;


  final String terminalCode;


  final String? terminalType;

  Terminal({
    required this.description,
    required this.distance,
    required this.name,
    required this.terminalCode,
    required this.terminalType,
  });

  factory Terminal.fromJson(dynamic json) {
    return Terminal(
      description: json['description'] != null ? ContentAndLanguage.fromJson(json['description'] as Map<String, dynamic>) : null,
      distance: json['distance'] as int,
      name: json['name'] != null ? ContentAndLanguage.fromJson(json['name'] as Map<String, dynamic>) : null,
      terminalCode: json['terminalCode'] ,
      terminalType: json['terminalType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description?.toJson(),
      'distance': distance,
      'name': name?.toJson(),
      'terminalCode': terminalCode,
      'terminalType': terminalType,
    };
  }

  Terminal copyWith({
    ContentAndLanguage? description,
    int? distance,
    ContentAndLanguage? name,
    String? terminalCode,
    String? terminalType,
  }) {
    return Terminal(
      description: description ?? this.description,
      distance: distance ?? this.distance,
      name: name ?? this.name,
      terminalCode: terminalCode ?? this.terminalCode,
      terminalType: terminalType ?? this.terminalType,
    );
  }

  @override
  int get hashCode => description.hashCode ^ distance.hashCode ^ name.hashCode ^ terminalCode.hashCode ^ terminalType.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Terminal &&
        other.description == description &&
        other.distance == distance &&
        other.name == name &&
        other.terminalCode == terminalCode &&
        other.terminalType == terminalType;
  }
}
