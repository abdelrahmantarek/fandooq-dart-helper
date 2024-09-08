part of '../hotel.dart';


class CategoryGroup {


  final String code;


  final ContentAndLanguage description;


  final ContentAndLanguage name;


  final int order;

  CategoryGroup({
    required this.code,
    required this.description,
    required this.name,
    required this.order,
  });

  factory CategoryGroup.fromJson(dynamic json) {
    return CategoryGroup(
      code: json['code'] as String,
      description: ContentAndLanguage.fromJson(json['description'] as Map<String, dynamic>),
      name: ContentAndLanguage.fromJson(json['name'] as Map<String, dynamic>),
      order: json['order'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'description': description.toJson(),
      'name': name.toJson(),
      'order': order,
    };
  }

  CategoryGroup copyWith({
    String? code,
    ContentAndLanguage? description,
    ContentAndLanguage? name,
    int? order,
  }) {
    return CategoryGroup(
      code: code ?? this.code,
      description: description ?? this.description,
      name: name ?? this.name,
      order: order ?? this.order,
    );
  }

  @override
  int get hashCode => code.hashCode ^ description.hashCode ^ name.hashCode ^ order.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CategoryGroup &&
        other.code == code &&
        other.description == description &&
        other.name == name &&
        other.order == order;
  }
}
