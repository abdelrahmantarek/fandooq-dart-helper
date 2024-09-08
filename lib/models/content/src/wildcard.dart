part of '../hotel.dart';


class Wildcard {
  final String? characteristicCode;
  final ContentAndLanguage? hotelRoomDescription;
  final String? roomCode;
  final String? roomType;

  Wildcard({
     this.characteristicCode,
     this.hotelRoomDescription,
     this.roomCode,
     this.roomType,
  });

  factory Wildcard.fromJson(dynamic json) {
    return Wildcard(
      characteristicCode: json['characteristicCode'] as String,
      hotelRoomDescription: ContentAndLanguage.fromJson(json['hotelRoomDescription'] as Map<String, dynamic>),
      roomCode: json['roomCode'] as String,
      roomType: json['roomType'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'characteristicCode': characteristicCode,
      'hotelRoomDescription': hotelRoomDescription?.toJson(),
      'roomCode': roomCode,
      'roomType': roomType,
    };
  }

  Wildcard copyWith({
    String? characteristicCode,
    ContentAndLanguage? hotelRoomDescription,
    String? roomCode,
    String? roomType,
  }) {
    return Wildcard(
      characteristicCode: characteristicCode ?? this.characteristicCode,
      hotelRoomDescription: hotelRoomDescription ?? this.hotelRoomDescription,
      roomCode: roomCode ?? this.roomCode,
      roomType: roomType ?? this.roomType,
    );
  }

  @override
  int get hashCode => characteristicCode.hashCode ^ hotelRoomDescription.hashCode ^ roomCode.hashCode ^ roomType.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Wildcard &&
        other.characteristicCode == characteristicCode &&
        other.hotelRoomDescription == hotelRoomDescription &&
        other.roomCode == roomCode &&
        other.roomType == roomType;
  }
}
