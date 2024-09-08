
part of '../booking.dart';


class PaymentCard {
  final String cardHolderName;
  final CardTypeRequest cardType;
  final String cardNumber;
  final String expiryDate;
  final String cardCVC;


  bool get isValid{
    return cardNumber.isNotEmpty;
  }

  PaymentCard({
    required this.cardHolderName,
    required this.cardType,
    required this.cardNumber,
    required this.expiryDate,
    required this.cardCVC,
  });

  PaymentCard copyWith({
    String? cardHolderName,
    CardTypeRequest? cardType,
    String? cardNumber,
    String? expiryDate,
    String? cardCVC,
  }) {
    return PaymentCard(
      cardHolderName: cardHolderName ?? this.cardHolderName,
      cardType: cardType ?? this.cardType,
      cardNumber: cardNumber ?? this.cardNumber,
      expiryDate: expiryDate ?? this.expiryDate,
      cardCVC: cardCVC ?? this.cardCVC,
    );
  }

  factory PaymentCard.fromJson(dynamic json) => PaymentCard(
    cardHolderName: json['cardHolderName'],
    cardType: json['cardType'],
    cardNumber: json['cardNumber'],
    expiryDate: json['expiryDate'],
    cardCVC: json['cardCVC'],
  );

  Map<String, dynamic> toJson() => {
    'cardHolderName': cardHolderName,
    'cardType': "VI",
    'cardNumber': cardNumber,
    'expiryDate': expiryDate,
    'cardCVC': cardCVC,
  };

}