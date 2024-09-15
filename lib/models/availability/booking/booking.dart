
import 'package:fandooq_helper_package/models/availability/hotel/hotel.dart';
import 'package:fandooq_helper_package/models/availability/rate/rate.dart';
import 'package:fandooq_helper_package/models/content/hotel.dart';

part 'src/biling-address.dart';
part 'src/card-type.dart';
part 'src/contact-data.dart';
part 'src/device-request.dart';
part 'src/extensions.dart';
part 'src/holder.dart';
part 'src/pax.dart';
part 'src/payment-card.dart';
part 'src/payment-data.dart';
part 'src/room-request-booking.dart';
part 'src/user-type.dart';
part 'src/invoice_company.dart';
part 'src/invoice-data-after-pay.dart';

class Booking{

  final String? reference;

  final String? clientReference;

  final String? creationDate;

  final String? status;

  final String? creationUser;

  final Holder? holder;

  final HotelModel? hotel;

  final InvoiceCompany? invoiceCompany;

  final double? totalSellingRate;

  final double? totalNet;

  final double? pendingAmount;

  final String? currency;

  final HotelContent? content;

  final BookingInvoiceData? bookingInvoiceData;

  final DateTime? createAt;


  Booking({
    this.reference,
    this.clientReference,
    this.creationDate,
    this.status,
    this.creationUser,
    this.holder,
    this.hotel,
    this.invoiceCompany,
    this.totalSellingRate,
    this.totalNet,
    this.pendingAmount,
    this.currency,
    this.content,
    this.bookingInvoiceData,
    this.createAt,
  });


  DateTime get dateTime{
    return DateTime.parse(creationDate!);
  }

  bool get canCancel{
    if(status == "CANCELLED"){
      return false;
    }
    return true;
  }

  Booking copyWith({
    String? reference,
    String? clientReference,
    String? creationDate,
    String? status,
    String? creationUser,
    Holder? holder,
    HotelModel? BookHotel,
    InvoiceCompany? invoiceCompany,
    double? totalSellingRate,
    double? totalNet,
    double? pendingAmount,
    String? currency,
    HotelContent? content,
    BookingInvoiceData? bookingInvoiceData,
    DateTime? createAt,
  }) => Booking(
    reference: reference ?? this.reference,
    clientReference: clientReference ?? this.clientReference,
    creationDate: creationDate ?? this.creationDate,
    status: status ?? this.status,
    creationUser: creationUser ?? this.creationUser,
    holder: holder ?? this.holder,
    hotel: BookHotel ?? this.hotel,
    invoiceCompany: invoiceCompany ?? this.invoiceCompany,
    totalSellingRate: totalSellingRate ?? this.totalSellingRate,
    totalNet: totalNet ?? this.totalNet,
    pendingAmount: pendingAmount ?? this.pendingAmount,
    currency: currency ?? this.currency,
    content: content ?? this.content,
    bookingInvoiceData: bookingInvoiceData ?? this.bookingInvoiceData,
    createAt: createAt ?? this.createAt,
  );


  factory Booking.fromJson(json){
    return Booking(
      reference: json['reference'],
      clientReference: json['clientReference'],
      creationDate: json['creationDate'],
      status: json['status'],
      creationUser: json['creationUser'],
      holder: json['holder'] != null ? Holder.fromJson(json['holder']) : null,
      hotel: json['hotel'] != null ? HotelModel.fromJson(json['hotel']) : null,
      invoiceCompany: json['invoiceCompany'] != null ? InvoiceCompany.fromJson(json['invoiceCompany']) : null,
      totalSellingRate: json['totalSellingRate']?.toDouble(),
      totalNet: json['totalNet']?.toDouble(),
      pendingAmount: json['pendingAmount']?.toDouble(),
      currency: json['currency'],
      content: json['content'] != null ? HotelContent.fromJson(json['content'][0]) : null,
      bookingInvoiceData: json['userPay'] != null ? BookingInvoiceData.fromJson(json['userPay'][0]) : null,
      createAt: json['createAt'] != null ? DateTime.parse(json['createAt']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'reference': reference,
    'clientReference': clientReference,
    'creationDate': creationDate,
    'status': status,
    'creationUser': creationUser,
    'holder': holder?.toJson(),
    'hotel': hotel?.toJson(),
    'invoiceCompany': invoiceCompany?.toJson(),
    'totalSellingRate': totalSellingRate,
    'totalNet': totalNet,
    'pendingAmount': pendingAmount,
    'currency': currency,
    'content': content?.toJson(),
    'bookingInvoiceData': bookingInvoiceData?.toJson(),
    'createAt': createAt?.toString(),
  };



}