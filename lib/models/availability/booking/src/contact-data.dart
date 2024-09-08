part of '../booking.dart';


class ContactData {
  final String email;
  final String phoneNumber;

  ContactData({
    required this.email,
    required this.phoneNumber,
  });

  ContactData copyWith({
    String? email,
    String? phoneNumber,
  }) {
    return ContactData(
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  factory ContactData.fromJson(dynamic json) => ContactData(
    email: json['email'],
    phoneNumber: json['phoneNumber'],
  );

  Map<String, dynamic> toJson() => {
    'email': email,
    'phoneNumber': phoneNumber,
  };
}
