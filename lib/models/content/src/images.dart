part of '../hotel.dart';


class ImageHotel {

  final String? characteristicCode;


  final String? imageTypeCode;


  final int? order;


  final String? path;


  final String? roomCode;


  final String? roomType;


  final ImageType? type; // تأكد من تعريف ImageType كـ HiveType إذا كان نوعاً مخصصاً


  final int? visualOrder;


  final String? PMSRoomCode;

  ImageHotel({
    required this.characteristicCode,
    required this.imageTypeCode,
    required this.order,
    required this.path,
    required this.roomCode,
    required this.roomType,
    required this.type,
    required this.visualOrder,
    required this.PMSRoomCode,
  });

  factory ImageHotel.fromJson(dynamic json) {
    return ImageHotel(
      characteristicCode: json['characteristicCode'],
      imageTypeCode: json['imageTypeCode'],
      order: json['order'],
      path: json['path'] ,
      roomCode: json['roomCode'] ,
      roomType: json['roomType'] ,
      type: json['type'] != null ? ImageType.fromJson(json['type'] as Map<String, dynamic>) : null,
      visualOrder: json['visualOrder'],
      PMSRoomCode: json['PMSRoomCode'] ,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'characteristicCode': characteristicCode,
      'imageTypeCode': imageTypeCode,
      'order': order,
      'path': path,
      'roomCode': roomCode,
      'roomType': roomType,
      'type': type?.toJson(),
      'visualOrder': visualOrder,
      'PMSRoomCode': PMSRoomCode,
    };
  }

  String get bigger{
    return "http://photos.hotelbeds.com/giata/bigger/$path";
  }

  String get medium{
    return "http://photos.hotelbeds.com/giata/medium/$path";
  }

  String get small{
    return "http://photos.hotelbeds.com/giata/small/$path";
  }

  String get xl{
    return "http://photos.hotelbeds.com/giata/xl/$path";
  }

  String get xxl{
    return "http://photos.hotelbeds.com/giata/xxl/$path";
  }

  String get original{
    return "http://photos.hotelbeds.com/giata/original/$path";
  }

  ImageHotel copyWith({
    String? characteristicCode,
    String? imageTypeCode,
    int? order,
    String? path,
    String? roomCode,
    String? roomType,
    ImageType? type,
    int? visualOrder,
    String? PMSRoomCode,
  }) {
    return ImageHotel(
      characteristicCode: characteristicCode ?? this.characteristicCode,
      imageTypeCode: imageTypeCode ?? this.imageTypeCode,
      order: order ?? this.order,
      path: path ?? this.path,
      roomCode: roomCode ?? this.roomCode,
      roomType: roomType ?? this.roomType,
      type: type ?? this.type,
      visualOrder: visualOrder ?? this.visualOrder,
      PMSRoomCode: PMSRoomCode ?? this.PMSRoomCode,
    );
  }

  @override
  int get hashCode => characteristicCode.hashCode ^ imageTypeCode.hashCode ^ order.hashCode ^ path.hashCode ^ roomCode.hashCode ^ roomType.hashCode ^ type.hashCode ^ visualOrder.hashCode ^ PMSRoomCode.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ImageHotel &&
        other.characteristicCode == characteristicCode &&
        other.imageTypeCode == imageTypeCode &&
        other.order == order &&
        other.path == path &&
        other.roomCode == roomCode &&
        other.roomType == roomType &&
        other.type == type &&
        other.visualOrder == visualOrder &&
        other.PMSRoomCode == PMSRoomCode;
  }
}

class ImageType {
  final String code;
  final ContentAndLanguage description;

  ImageType({
    required this.code,
    required this.description,
  });

  factory ImageType.fromJson(dynamic json) {
    return ImageType(
      code: json['code'] ,
      description: ContentAndLanguage.fromJson(json['description'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'description': description.toJson(),
    };
  }

// Implement copyWith, hashCode, and operator == methods
}
