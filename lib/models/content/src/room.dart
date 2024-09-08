
part of '../hotel.dart';


class RoomContent {


  final String characteristicCode;


  final String? description;


  final String roomCode;


  final List<Facility> roomFacilities; // تأكد من تحويل RoomFacility


  final List<RoomStay> roomStays; // تأكد من تحويل RoomStay


  final String roomType;

  RoomContent({
    required this.characteristicCode,
    required this.description,
    required this.roomCode,
    required this.roomFacilities,
    required this.roomStays,
    required this.roomType,
  });

  factory RoomContent.fromJson(dynamic json) {
    return RoomContent(
      characteristicCode: json['characteristicCode'],
      description: json['description'],
      roomCode: json['roomCode'],
      roomFacilities: ((json['roomFacilities'] ?? []) as List).map((e) => Facility.fromJson(e)).toList(),
      roomStays: ((json['roomStays'] ?? []) as List).map((e) => RoomStay.fromJson(e)).toList(),
      roomType: json['roomType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'characteristicCode': characteristicCode,
      'description': description,
      'roomCode': roomCode,
      'roomFacilities': roomFacilities.map((e) => e.toJson()).toList(),
      'roomStays': roomStays.map((e) => e.toJson()).toList(),
      'roomType': roomType,
    };
  }

  RoomContent copyWith({
    String? characteristicCode,
    String? description,
    String? roomCode,
    List<Facility>? roomFacilities,
    List<RoomStay>? roomStays,
    String? roomType,
  }) {
    return RoomContent(
      characteristicCode: characteristicCode ?? this.characteristicCode,
      description: description ?? this.description,
      roomCode: roomCode ?? this.roomCode,
      roomFacilities: roomFacilities ?? this.roomFacilities,
      roomStays: roomStays ?? this.roomStays,
      roomType: roomType ?? this.roomType,
    );
  }

  @override
  int get hashCode => characteristicCode.hashCode ^ description.hashCode ^ roomCode.hashCode ^ roomFacilities.hashCode ^ roomStays.hashCode ^ roomType.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RoomContent &&
        other.characteristicCode == characteristicCode &&
        other.description == description &&
        other.roomCode == roomCode &&
        other.roomType == roomType;
  }

}

