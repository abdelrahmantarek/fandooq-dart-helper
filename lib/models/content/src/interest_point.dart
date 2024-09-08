part of '../hotel.dart';


class InterestPoint extends Searchable{


  final String? distance;


  final int? facilityCode;


  final int? facilityGroupCode;


  final bool? fee;


  final int? order;


  final String? poiName;

  InterestPoint({
    required this.distance,
    required this.facilityCode,
    required this.facilityGroupCode,
    required this.fee,
    required this.order,
    required this.poiName,
  });

  factory InterestPoint.fromJson(dynamic json) {
    return InterestPoint(
      distance: json['distance'],
      facilityCode: json['facilityCode'],
      facilityGroupCode: json['facilityGroupCode'],
      fee: json['fee'],
      order: json['order'],
      poiName: json['poiName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'distance': distance,
      'facilityCode': facilityCode,
      'facilityGroupCode': facilityGroupCode,
      'fee': fee,
      'order': order,
      'poiName': poiName,
    };
  }

  InterestPoint copyWith({
    String? distance,
    int? facilityCode,
    int? facilityGroupCode,
    bool? fee,
    int? order,
    String? poiName,
  }) {
    return InterestPoint(
      distance: distance ?? this.distance,
      facilityCode: facilityCode ?? this.facilityCode,
      facilityGroupCode: facilityGroupCode ?? this.facilityGroupCode,
      fee: fee ?? this.fee,
      order: order ?? this.order,
      poiName: poiName ?? this.poiName,
    );
  }

  @override
  int get hashCode => distance.hashCode ^ facilityCode.hashCode ^ facilityGroupCode.hashCode ^ poiName.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is InterestPoint &&
        other.distance == distance &&
        other.facilityCode == facilityCode &&
        other.facilityGroupCode == facilityGroupCode &&
        other.poiName == poiName;
  }

  @override
  // TODO: implement getText
  String get getText => poiName ?? "";

}
