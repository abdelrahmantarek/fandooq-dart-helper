
part of '../booking.dart';


class BookingInvoiceData {

  final String reference;
  final String clientReference;
  final String createAt;
  final UserPayDetails priceInvoice;
  final UserPayDetails priceHotel;
  final String paymentIntentId;

  BookingInvoiceData({
    required this.reference,
    required this.clientReference,
    required this.createAt,
    required this.priceInvoice,
    required this.priceHotel,
    required this.paymentIntentId,
  });

  // دالة fromJson لتحويل البيانات القادمة من JSON إلى كائن Dart
  factory BookingInvoiceData.fromJson(Map<String, dynamic> json) {
    print("referencereferencereferencereference  "+json.keys.toString());
    return BookingInvoiceData(
      reference: json['reference'],
      clientReference: json['clientReference'],
      createAt: json['createAt'],
      priceInvoice: UserPayDetails.fromJson(json['priceInvoice']),
      priceHotel: UserPayDetails.fromJson(json['priceHotel']),
      paymentIntentId: json['paymentIntentId'],
    );
  }

  // دالة toJson لتحويل كائن Dart إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'reference': reference,
      'clientReference': clientReference,
      'createAt': createAt,
      'priceInvoice': priceInvoice.toJson(),
      'priceHotel': priceHotel.toJson(),
      'paymentIntentId': paymentIntentId,
    };
  }

  // دالة copyWith لإنشاء نسخة جديدة من الكائن مع إمكانية تعديل بعض الخصائص
  BookingInvoiceData copyWith({
    String? reference,
    String? clientReference,
    String? createAt,
    UserPayDetails? priceInvoice,
    UserPayDetails? priceHotel,
    String? paymentIntentId,
  }) {
    return BookingInvoiceData(
      reference: reference ?? this.reference,
      clientReference: clientReference ?? this.clientReference,
      createAt: createAt ?? this.createAt,
      paymentIntentId: paymentIntentId ?? this.paymentIntentId,
      priceInvoice: priceInvoice ?? this.priceInvoice,
      priceHotel: priceHotel ?? this.priceHotel,
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
        other.paymentIntentId == paymentIntentId;
  }

  // دالة hashCode لتحسين الأداء عند استخدام الكائنات في هياكل البيانات
  @override
  int get hashCode {
    return reference.hashCode ^
    clientReference.hashCode ^
    createAt.hashCode ^
    paymentIntentId.hashCode;
  }
}

class UserPayDetails {
  final String? subtotal;
  final String? grandTotal;
  final String? currencyHotel;
  final String? currencyUserView;
  final List<RateDiscount>? rateDiscounts;

  UserPayDetails({
    required this.subtotal,
    required this.grandTotal,
    required this.rateDiscounts,
    required this.currencyUserView,
    required this.currencyHotel,
  });

  // دالة fromJson لتحويل البيانات القادمة من JSON إلى كائن Dart
  factory UserPayDetails.fromJson(Map<String, dynamic> json) {
    return UserPayDetails(
      subtotal: json['subtotal'],
      grandTotal: json['grandTotal'],
      currencyHotel: json['currencyHotel'],
      currencyUserView: json['currencyUserView'],
      rateDiscounts: ((json['rateDiscounts'] ?? []) as List).map((e)=> RateDiscount.fromJson(e)).toList(),
    );
  }

  // دالة toJson لتحويل كائن Dart إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'subtotal': subtotal,
      'grandTotal': grandTotal,
      'currencyHotel': currencyHotel,
      'currencyUserView': currencyUserView,
      'rateDiscounts': rateDiscounts?.map((e) => e.toJson()).toList(),
    };
  }

  // دالة copyWith لإنشاء نسخة جديدة من الكائن مع إمكانية تعديل بعض الخصائص
  UserPayDetails copyWith({
    String? subtotal,
    String? grandTotal,
    String? currencyHotel,
    String? currencyUserView,
    List<RateDiscount>? rateDiscounts,
  }) {
    return UserPayDetails(
      subtotal: subtotal ?? this.subtotal,
      grandTotal: grandTotal ?? this.grandTotal,
      currencyHotel: currencyHotel ?? this.currencyHotel,
      currencyUserView: currencyUserView ?? this.currencyUserView,
      rateDiscounts: rateDiscounts ?? this.rateDiscounts,
    );
  }

}
