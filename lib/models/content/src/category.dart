part of '../hotel.dart';


class Category {


  final String accommodationType;


  final String code;


  final ContentAndLanguage description;


  final String group;


  final int simpleCode;

  Category({
    required this.accommodationType,
    required this.code,
    required this.description,
    required this.group,
    required this.simpleCode,
  });

  factory Category.fromJson(dynamic json) {
    return Category(
      accommodationType: json['accommodationType'] as String,
      code: json['code'] as String,
      description: ContentAndLanguage.fromJson(json['description'] as Map<String, dynamic>),
      group: json['group'] as String,
      simpleCode: json['simpleCode'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accommodationType': accommodationType,
      'code': code,
      'description': description.toJson(),
      'group': group,
      'simpleCode': simpleCode,
    };
  }

  Category copyWith({
    String? accommodationType,
    String? code,
    ContentAndLanguage? description,
    String? group,
    int? simpleCode,
  }) {
    return Category(
      accommodationType: accommodationType ?? this.accommodationType,
      code: code ?? this.code,
      description: description ?? this.description,
      group: group ?? this.group,
      simpleCode: simpleCode ?? this.simpleCode,
    );
  }

  @override
  int get hashCode => accommodationType.hashCode ^ code.hashCode ^ description.hashCode ^ group.hashCode ^ simpleCode.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Category &&
        other.accommodationType == accommodationType &&
        other.code == code &&
        other.description == description &&
        other.group == group &&
        other.simpleCode == simpleCode;
  }
}
