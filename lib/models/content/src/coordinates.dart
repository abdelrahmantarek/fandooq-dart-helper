part of '../hotel.dart';


class Coordinates {

  String type;

  List<double> coordinates;

  Coordinates({required this.type, required this.coordinates});

  factory Coordinates.fromJson(dynamic json) {

    if(json.containsKey("latitude")){
      return Coordinates(
        type: "Point",
        coordinates: List<double>.from([
          json["longitude"],
          json["latitude"],
        ]),
      );
    }

    return Coordinates(
      type: json['type'],
      coordinates: List<double>.from(json['coordinates']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'coordinates': coordinates,
    };
  }

  Coordinates copyWith({
    String? type,
    List<double>? coordinates,
  }) {
    return Coordinates(
      type: type ?? this.type,
      coordinates: coordinates ?? this.coordinates,
    );
  }

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Coordinates &&
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  double get latitude => coordinates[1];
  double get longitude => coordinates[0];

}



