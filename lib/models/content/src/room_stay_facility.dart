part of '../hotel.dart';


class RoomStayFacility {

  final ContentAndLanguage? description;


  final int facilityCode;


  final int facilityGroupCode;


  final int number;

  RoomStayFacility({
    required this.description,
    required this.facilityCode,
    required this.facilityGroupCode,
    required this.number,
  });

  factory RoomStayFacility.fromJson(dynamic json) {
    return RoomStayFacility(
      description: json['description'] != null ? ContentAndLanguage.fromJson(json['description'] as Map<String, dynamic>) : null,
      facilityCode: json['facilityCode'] as int,
      facilityGroupCode: json['facilityGroupCode'] as int,
      number: json['number'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description?.toJson(),
      'facilityCode': facilityCode,
      'facilityGroupCode': facilityGroupCode,
      'number': number,
    };
  }

  RoomStayFacility copyWith({
    ContentAndLanguage? description,
    int? facilityCode,
    int? facilityGroupCode,
    int? number,
  }) {
    return RoomStayFacility(
      description: description ?? this.description,
      facilityCode: facilityCode ?? this.facilityCode,
      facilityGroupCode: facilityGroupCode ?? this.facilityGroupCode,
      number: number ?? this.number,
    );
  }

  @override
  int get hashCode => description.hashCode ^ facilityCode.hashCode ^ facilityGroupCode.hashCode ^ number.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RoomStayFacility &&
        other.description == description &&
        other.facilityCode == facilityCode &&
        other.facilityGroupCode == facilityGroupCode &&
        other.number == number;
  }
}
