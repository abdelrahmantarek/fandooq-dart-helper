part of '../hotel.dart';


class Segment {

  final int code;


  final ContentAndLanguage description;

  Segment({
    required this.code,
    required this.description,
  });

  factory Segment.fromJson(dynamic json) {
    return Segment(
      code: json['code'] as int,
      description: ContentAndLanguage.fromJson(json['description'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'description': description.toJson(),
    };
  }

  Segment copyWith({
    int? code,
    ContentAndLanguage? description,
  }) {
    return Segment(
      code: code ?? this.code,
      description: description ?? this.description,
    );
  }

  @override
  int get hashCode => code.hashCode ^ description.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Segment &&
        other.code == code &&
        other.description == description;
  }
}
