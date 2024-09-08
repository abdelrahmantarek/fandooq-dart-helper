part of '../hotel.dart';


class Chain {


  final int code;


  final ContentAndLanguage description;

  Chain({
    required this.code,
    required this.description,
  });

  factory Chain.fromJson(dynamic json) {
    return Chain(
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

  Chain copyWith({
    int? code,
    ContentAndLanguage? description,
  }) {
    return Chain(
      code: code ?? this.code,
      description: description ?? this.description,
    );
  }

  @override
  int get hashCode => code.hashCode ^ description.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Chain &&
        other.code == code &&
        other.description == description;
  }
}
