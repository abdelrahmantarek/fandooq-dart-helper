
part of '../booking.dart';

class ApiBillingAddress {
  final String? address1;
  final String? address2;
  final String? city;
  final String? state;
  final String? postalCode;
  final String? countryCode;

  ApiBillingAddress({
    this.address1,
    this.address2,
    required this.city,
    this.state,
    required this.postalCode,
    required this.countryCode,
  });

  ApiBillingAddress copyWith({
    String? address1,
    String? address2,
    String? city,
    String? state,
    String? postalCode,
    String? countryCode,
  }) {
    return ApiBillingAddress(
      address1: address1 ?? this.address1,
      address2: address2 ?? this.address2,
      city: city ?? this.city,
      state: state ?? this.state,
      postalCode: postalCode ?? this.postalCode,
      countryCode: countryCode ?? this.countryCode,
    );
  }

  factory ApiBillingAddress.fromJson(dynamic json) {
    return ApiBillingAddress(
      address1: json['address1'],
      address2: json['address2'],
      city: json['city'],
      state: json['state'],
      postalCode: json['postalCode'],
      countryCode: json['countryCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address1': address1,
      'address2': address2,
      'city': city,
      'state': state,
      'postalCode': postalCode,
      'countryCode': countryCode,
    };
  }

}
