
part of '../hotel.dart';


class Country {


  final String code;


  final ContentAndLanguage description;


  final String isoCode;


  final List<StateContent> states;

  Country({
    required this.code,
    required this.description,
    required this.isoCode,
    required this.states,
  });

  factory Country.fromJson(dynamic json) {
    return Country(
      code: json['code'] as String,
      description: ContentAndLanguage.fromJson(json['description'] as Map<String, dynamic>),
      isoCode: json['isoCode'] as String,
      states: (json['states'] as List).map((e) => StateContent.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'description': description.toJson(),
      'isoCode': isoCode,
      'states': states.map((e) => e.toJson()).toList(),
    };
  }

  Country copyWith({
    String? code,
    ContentAndLanguage? description,
    String? isoCode,
    List<StateContent>? states,
  }) {
    return Country(
      code: code ?? this.code,
      description: description ?? this.description,
      isoCode: isoCode ?? this.isoCode,
      states: states ?? this.states,
    );
  }

  @override
  int get hashCode => code.hashCode ^ description.hashCode ^ isoCode.hashCode ^ states.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Country &&
        other.code == code &&
        other.description == description &&
        other.isoCode == isoCode;
  }

}




