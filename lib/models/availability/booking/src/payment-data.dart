
part of '../booking.dart';

class PaymentData {
  final PaymentCard paymentCard;
  final ContactData contactData;
  final ApiBillingAddress? billingAddress;
  final DeviceRequest deviceRequest;

  PaymentData({
    required this.paymentCard,
    required this.contactData,
    this.billingAddress,
    required this.deviceRequest,
  });

  PaymentData copyWith({
    PaymentCard? paymentCard,
    ContactData? contactData,
    ApiBillingAddress? billingAddress,
    DeviceRequest? deviceRequest,
  }) {
    return PaymentData(
      paymentCard: paymentCard ?? this.paymentCard,
      contactData: contactData ?? this.contactData,
      billingAddress: billingAddress ?? this.billingAddress,
      deviceRequest: deviceRequest ?? this.deviceRequest,
    );
  }



  Map<String, dynamic> toJson() => {
    'paymentCard': paymentCard.toJson(),
    'contactData': contactData.toJson(),
    'billingAddress': billingAddress?.toJson(),
    // 'device': deviceRequest.toJson(),
    // "webPartner": "1",
  };


}

