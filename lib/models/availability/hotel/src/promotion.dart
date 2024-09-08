
part of '../hotel.dart';

class Promotion {
  final String? code;
  final String? name;
  final String? remark;

  Promotion({
    required this.code,
    required this.name,
    this.remark,
  });

  // Factory constructor to create a Promotion from JSON
  factory Promotion.fromJson(Map<String, dynamic> json) {
    return Promotion(
      code: json['code'],
      name: json['name'],
      remark: json['remark'],
    );
  }

  // Method to convert a Promotion instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'name': name,
      'remark': remark,
    };
  }

  @override
  String toString() {
    return 'Promotion(code: $code, name: $name, remark: $remark)';
  }
}
