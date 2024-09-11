
part of '../booking.dart';


class BookingInvoiceData {
  final String reference;
  final String clientReference;
  final String createAt;
  final UserPayDetails userPayDetails;
  final String paymentIntentId;

  BookingInvoiceData({
    required this.reference,
    required this.clientReference,
    required this.createAt,
    required this.userPayDetails,
    required this.paymentIntentId,
  });

  // دالة fromJson لتحويل البيانات القادمة من JSON إلى كائن Dart
  factory BookingInvoiceData.fromJson(Map<String, dynamic> json) {
    return BookingInvoiceData(
      reference: json['reference'],
      clientReference: json['clientReference'],
      createAt: json['createAt'],
      userPayDetails: UserPayDetails.fromJson(json['userPayDetails']),
      paymentIntentId: json['paymentIntentId'],
    );
  }

  // دالة toJson لتحويل كائن Dart إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'reference': reference,
      'clientReference': clientReference,
      'createAt': createAt,
      'userPayDetails': userPayDetails.toJson(),
      'paymentIntentId': paymentIntentId,
    };
  }

  // دالة copyWith لإنشاء نسخة جديدة من الكائن مع إمكانية تعديل بعض الخصائص
  BookingInvoiceData copyWith({
    String? reference,
    String? clientReference,
    String? createAt,
    UserPayDetails? userPayDetails,
    String? paymentIntentId,
  }) {
    return BookingInvoiceData(
      reference: reference ?? this.reference,
      clientReference: clientReference ?? this.clientReference,
      createAt: createAt ?? this.createAt,
      userPayDetails: userPayDetails ?? this.userPayDetails,
      paymentIntentId: paymentIntentId ?? this.paymentIntentId,
    );
  }

  // دالة == للتحقق من تساوي الكائنات
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BookingInvoiceData &&
        other.reference == reference &&
        other.clientReference == clientReference &&
        other.createAt == createAt &&
        other.userPayDetails == userPayDetails &&
        other.paymentIntentId == paymentIntentId;
  }

  // دالة hashCode لتحسين الأداء عند استخدام الكائنات في هياكل البيانات
  @override
  int get hashCode {
    return reference.hashCode ^
    clientReference.hashCode ^
    createAt.hashCode ^
    userPayDetails.hashCode ^
    paymentIntentId.hashCode;
  }
}

class UserPayDetails {
  final double subtotal;
  final double grandTotal;
  final String currency;
  final List<RateDiscount> rateDiscounts;

  UserPayDetails({
    required this.subtotal,
    required this.grandTotal,
    required this.currency,
    required this.rateDiscounts,
  });

  // دالة fromJson لتحويل البيانات القادمة من JSON إلى كائن Dart
  factory UserPayDetails.fromJson(Map<String, dynamic> json) {
    return UserPayDetails(
      subtotal: json['subtotal'],
      grandTotal: json['grandTotal'],
      currency: json['currency'],
      rateDiscounts: List<RateDiscount>.from(
        json['rateDiscounts'].map((e) => RateDiscount.fromJson(e)),
      ),
    );
  }

  // دالة toJson لتحويل كائن Dart إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'subtotal': subtotal,
      'grandTotal': grandTotal,
      'currency': currency,
      'rateDiscounts': rateDiscounts.map((e) => e.toJson()).toList(),
    };
  }

  // دالة copyWith لإنشاء نسخة جديدة من الكائن مع إمكانية تعديل بعض الخصائص
  UserPayDetails copyWith({
    double? subtotal,
    double? grandTotal,
    String? currency,
    List<RateDiscount>? rateDiscounts,
  }) {
    return UserPayDetails(
      subtotal: subtotal ?? this.subtotal,
      grandTotal: grandTotal ?? this.grandTotal,
      currency: currency ?? this.currency,
      rateDiscounts: rateDiscounts ?? this.rateDiscounts,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserPayDetails &&
        other.subtotal == subtotal &&
        other.grandTotal == grandTotal &&
        other.currency == currency &&
        other.rateDiscounts == rateDiscounts;
  }

  @override
  int get hashCode {
    return subtotal.hashCode ^
    grandTotal.hashCode ^
    currency.hashCode ^
    rateDiscounts.hashCode;
  }
}
