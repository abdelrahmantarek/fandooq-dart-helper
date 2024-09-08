
class PaymentIntentRequest {
  final String? amount;
  final String? currency;
  final String? paymentMethodType;
  final String? paymentMethod;
  final String? customerId;
  final String? captureMethod;
  final bool? offSession;
  final bool? confirm;

  PaymentIntentRequest({
     this.amount,
     this.currency,
     this.paymentMethodType,
     this.paymentMethod,
     this.customerId,
     this.offSession,
     this.captureMethod,
     this.confirm,
  });

  // دالة fromJson لتحويل JSON إلى كائن Dart
  factory PaymentIntentRequest.fromJson(dynamic json) {
    return PaymentIntentRequest(
      amount: json['amount'],
      currency: json['currency'],
      paymentMethodType: json['payment_method_types[]'],
      paymentMethod: json['payment_method'],
      customerId: json['customer'],
      offSession: json['off_session'],
      captureMethod: json['capture_method'],
      confirm: json['confirm'],
    );
  }

  // دالة toJson لتحويل كائن Dart إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'currency': currency,
      'payment_method_types[]': paymentMethodType,
      'payment_method': paymentMethod,
      'customer': customerId,
      'off_session': offSession,
      'capture_method': captureMethod,
      'confirm': confirm,
    };
  }

  /*
      var data = {
      'amount': amount,
      'currency': currency,
      'payment_method_types[]': paymentType,
      'payment_method': paymentMethod,
      'customer': customerId,
      'off_session': offSession,
      'confirm': confirm,
    };

    /*
            paymentMethod: paymentMethodId,
        customer: customerId,
        offSession: off_session,
        confirm: confirm,
     */
   */

  @override
  String toString() {
    return 'PaymentIntentRequest(amount: $amount, currency: $currency, paymentType: $paymentMethodType, paymentMethod: $paymentMethod, customerId: $customerId, offSession: $offSession, confirm: $confirm)';
  }
}
