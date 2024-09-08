part of '../hotel.dart';


class RoomStay {

  final String? description;


  final String order;


  final List<RoomStayFacility> roomStayFacilities; // تأكد من تحويل RoomStayFacility


  final String? stayType;

  RoomStay({
    required this.description,
    required this.order,
    required this.roomStayFacilities,
    required this.stayType,
  });

  factory RoomStay.fromJson(dynamic json) {
    return RoomStay(
      description: json['description'],
      order: json['order'],
      roomStayFacilities: ((json['roomStayFacilities'] ?? []) as List).map((e) => RoomStayFacility.fromJson(e)).toList(),
      stayType: json['stayType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'order': order,
      'roomStayFacilities': roomStayFacilities.map((e) => e.toJson()).toList(),
      'stayType': stayType,
    };
  }

  RoomStay copyWith({
    String? description,
    String? order,
    List<RoomStayFacility>? roomStayFacilities,
    String? stayType,
  }) {
    return RoomStay(
      description: description ?? this.description,
      order: order ?? this.order,
      roomStayFacilities: roomStayFacilities ?? this.roomStayFacilities,
      stayType: stayType ?? this.stayType,
    );
  }

  @override
  int get hashCode => description.hashCode ^ order.hashCode ^ roomStayFacilities.hashCode ^ stayType.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RoomStay &&
        other.description == description &&
        other.order == order &&
        other.stayType == stayType;
  }
}

