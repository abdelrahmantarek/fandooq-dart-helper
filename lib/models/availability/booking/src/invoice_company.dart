
part of '../booking.dart';

class InvoiceCompany {

  final String? code;

  final String? company;

  final String? registrationNumber;

  InvoiceCompany({
    this.code,
    this.company,
    this.registrationNumber,
  });

  InvoiceCompany copyWith({
    String? code,
    String? company,
    String? registrationNumber,
  }) => InvoiceCompany(
    code: code ?? this.code,
    company: company ?? this.company,
    registrationNumber: registrationNumber ?? this.registrationNumber,
  );

  factory InvoiceCompany.fromJson(dynamic json) => InvoiceCompany(
    code: json['code'],
    company: json['company'],
    registrationNumber: json['registrationNumber'],
  );

  Map<String, dynamic> toJson() => {
    'code': code,
    'company': company,
    'registrationNumber': registrationNumber,
  };

}