part of '../booking.dart';


class Holder {

  final String? name;
  final String? surname;
  final String? email;
  final String? phone;
  final dynamic countryCode;

  Holder({
    this.name,
    this.surname,
    this.email,
    this.phone,
    this.countryCode,
  });

  Holder copyWith({
    String? name,
    String? surname,
    String? email,
    String? phone,
    dynamic countryCode,
  }) {
    return Holder(
      name: name ?? this.name,
      surname: surname ?? this.surname,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      countryCode: countryCode ?? this.countryCode,
    );
  }

  factory Holder.fromJson(dynamic json) => Holder(
    name: json['name'],
    surname: json['surname'],
    email: json['email'],
    phone: json['phone'],
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'surname': surname,
    'email': email,
    'phone': phone,
    'countryCode': countryCode?.toJson(),
  };

}
