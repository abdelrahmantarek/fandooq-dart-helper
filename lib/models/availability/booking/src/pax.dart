
part of '../booking.dart';

class Pax {
  final int roomId;
  final String type;
  final String? name;
  final String? surname;

  Pax({
    required this.roomId,
    required this.type,
    this.name,
    this.surname,
  });

  Pax copyWith({
    int? roomId,
    String? type,
    String? name,
    String? surname,
  }) {
    return Pax(
      roomId: roomId ?? this.roomId,
      type: type ?? this.type,
      name: name ?? this.name,
      surname: surname ?? this.surname,
    );
  }

  factory Pax.fromJson(dynamic json) => Pax(
    roomId: json['roomId'],
    type: json['type'],
    name: json['name'],
    surname: json['surname'],
  );

  Map<String, dynamic> toJson() => {
    'roomId': roomId,
    'type': type,
    'name': name,
    'surname': surname,
  };
}
