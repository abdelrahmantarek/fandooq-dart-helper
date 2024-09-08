part of '../hotel.dart';


class StateContent {


  final String? code;


  final String? name;

  StateContent({
    required this.code,
    required this.name,
  });

  factory StateContent.fromJson(dynamic json) {
    return StateContent(
      code: json['code'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'name': name,
    };
  }

  StateContent copyWith({
    String? code,
    String? name,
  }) {
    return StateContent(
      code: code ?? this.code,
      name: name ?? this.name,
    );
  }

  @override
  int get hashCode => code.hashCode ^ name.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is StateContent &&
        other.code == code &&
        other.name == name;
  }
}