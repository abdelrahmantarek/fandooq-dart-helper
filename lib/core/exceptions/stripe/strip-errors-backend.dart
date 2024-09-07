
import 'package:dio/dio.dart';

class StripErrorsBackEnd{

  error(e){
    if (e is DioException) {
      // التعامل مع أخطاء Dio
      if (e.response != null) {
        // التعامل مع استجابة الخطأ من Stripe
        switch (e.response?.statusCode) {
          case 400:
            print('Bad Request: Invalid parameters provided.');
            break;
          case 401:
            print('Unauthorized: Invalid API Key.');
            break;
          case 402:
          // عادةً ما يستخدم خطأ 402 لمشاكل الدفع مثل البطاقة مرفوضة أو مشاكل الاستيلاء
            String? stripeErrorCode = e.response?.data['error']['code'];
            if (stripeErrorCode == 'payment_intent_unexpected_state') {
              print('Payment Intent is in an unexpected state, cannot capture.');
            } else if (stripeErrorCode == 'card_declined') {
              print('Card Declined during capture.');
            } else {
              print('Payment Error: ${e.response?.data['error']['message']}');
            }
            break;
          case 404:
            print('Payment Intent Not Found: Check the paymentIntentId.');
            break;
          case 500:
            print('Internal Server Error: Please try again later.');
            break;
          default:
            print('Unhandled Error: ${e.response?.statusCode}');
            print('Error Details: ${e.response?.data}');
        }
      } else {
        // خطأ في الشبكة أو خطأ داخلي في Dio
        print('Network Error or Dio Error: ${e.message}');
      }
    } else {
      // أخطاء غير متوقعة
      print('Unknown error: $e');
    }
  }

}