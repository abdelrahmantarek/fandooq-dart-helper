
part of '../hotel.dart';


class Board {


  final String code;


  final ContentAndLanguage description;


  final String multiLingualCode;

  Board({
    required this.code,
    required this.description,
    required this.multiLingualCode,
  });

  factory Board.fromJson(dynamic json) {
    return Board(
      code: json['code'] as String,
      description: ContentAndLanguage.fromJson(json['description'] as Map<String, dynamic>),
      multiLingualCode: json['multiLingualCode'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'description': description.toJson(),
      'multiLingualCode': multiLingualCode,
    };
  }

  Board copyWith({
    String? code,
    ContentAndLanguage? description,
    String? multiLingualCode,
  }) {
    return Board(
      code: code ?? this.code,
      description: description ?? this.description,
      multiLingualCode: multiLingualCode ?? this.multiLingualCode,
    );
  }

  @override
  int get hashCode => code.hashCode ^ description.hashCode ^ multiLingualCode.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Board &&
        other.code == code &&
        other.description == description &&
        other.multiLingualCode == multiLingualCode;
  }
}

