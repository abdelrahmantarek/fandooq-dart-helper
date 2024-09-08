part of '../hotel.dart';


class Phone {


  final String phoneNumber;


  final String phoneType;


  Phone({
    required this.phoneNumber,
    required this.phoneType,
  });

  factory Phone.fromJson(dynamic json) {
    return Phone(
      phoneNumber: json['phoneNumber'],
      phoneType: json['phoneType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'phoneNumber': phoneNumber,
      'phoneType': phoneType,
    };
  }

  Phone copyWith({
    String? phoneNumber,
    String? phoneType,
  }) {
    return Phone(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      phoneType: phoneType ?? this.phoneType,
    );
  }

  @override
  int get hashCode => phoneNumber.hashCode ^ phoneType.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Phone &&
        other.phoneNumber == phoneNumber &&
        other.phoneType == phoneType;
  }
}
