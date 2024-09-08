
part of '../hotel.dart';


class AccommodationType {


  final String code;

  final String typeDescription;


  final ContentAndLanguage typeMultiDescription;

  AccommodationType({
    required this.code,
    required this.typeDescription,
    required this.typeMultiDescription,
  });

  factory AccommodationType.fromJson(dynamic json) {
    return AccommodationType(
      code: json['code'] as String,
      typeDescription: json['typeDescription'] as String,
      typeMultiDescription: ContentAndLanguage.fromJson(json['typeMultiDescription'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'typeDescription': typeDescription,
      'typeMultiDescription': typeMultiDescription.toJson(),
    };
  }

  AccommodationType copyWith({
    String? code,
    String? typeDescription,
    ContentAndLanguage? typeMultiDescription,
  }) {
    return AccommodationType(
      code: code ?? this.code,
      typeDescription: typeDescription ?? this.typeDescription,
      typeMultiDescription: typeMultiDescription ?? this.typeMultiDescription,
    );
  }

  @override
  int get hashCode => code.hashCode ^ typeDescription.hashCode ^ typeMultiDescription.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AccommodationType &&
        other.code == code &&
        other.typeDescription == typeDescription &&
        other.typeMultiDescription == typeMultiDescription;
  }
}



