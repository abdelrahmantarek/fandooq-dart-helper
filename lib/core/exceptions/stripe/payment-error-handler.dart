import 'package:dio/dio.dart';

class PaymentErrorHandler{

  String? message;

  PaymentErrorHandler(
    this.message
  );

  factory PaymentErrorHandler.fromError(error){
    return PaymentErrorHandler(
       PaymentErrorHandler.handleError(error)
    );
  }

  // دالة لمعالجة الأخطاء
  static String handleError(dynamic error) {
    if (error is DioException) {
      // إذا كان الخطأ من Dio
      if (error.response != null) {
        // إذا كان الخطأ رد من الخادم (HTTP Errors)
        final statusCode = error.response!.statusCode;
        return _handleHttpError(statusCode, error.response!.data);
      } else {
        // أخطاء اتصال أو مهلة
        return _handleDioError(error.type);
      }
    } else {
      // إذا كان الخطأ غير محدد أو عام
      return 'Unknown error occurred. Please try again.';
    }
  }

  // دالة لمعالجة أخطاء HTTP (Stripe API)
  static String _handleHttpError(int? statusCode, dynamic responseData) {

    if (responseData != null && responseData is Map<String, dynamic>) {
      final errorCode = responseData['error']?['code'];
      final errorMessage = responseData['error']?['message'];

      switch (errorCode) {
        case 'card_declined':
          return 'Card declined: The card was declined. Please use a different card.';
        case 'expired_card':
          return 'Expired Card: The card has expired. Please use another card.';
        case 'incorrect_cvc':
          return 'Incorrect CVC: The CVC code is incorrect.';
        case 'insufficient_funds':
          return 'Insufficient Funds: The card does not have enough funds.';
        case 'authentication_required':
          return 'Authentication required: Please authenticate the payment to proceed.';
        default:
        // إذا لم يكن هناك كود خطأ محدد، نرجع رسالة الخطأ العامة
          return errorMessage ?? 'Unexpected error occurred during payment.';
      }
    }

    // معالجة الأخطاء بناءً على كود HTTP
    switch (statusCode) {
      case 400:
        return 'Bad Request: Invalid request. Please check the details and try again.';
      case 401:
        return 'Unauthorized: Invalid API key or missing permissions.';
      case 403:
        return 'Forbidden: You don\'t have permission to access this resource.';
      case 404:
        return 'Not Found: The requested resource could not be found.';
      case 500:
        return 'Internal Server Error: Something went wrong on Stripe\'s end.';
      default:
        return 'Unexpected error: Status code $statusCode.';
    }
  }

  // دالة لمعالجة أخطاء Dio (مثل مهلة الاتصال)
  static String _handleDioError(DioExceptionType errorType) {
    switch (errorType) {
      case DioExceptionType.connectionTimeout:
        return 'Connection Timeout: The request took too long to connect to the server.';
      case DioExceptionType.sendTimeout:
        return 'Send Timeout: The request took too long to send.';
      case DioExceptionType.receiveTimeout:
        return 'Receive Timeout: The server took too long to respond.';
      case DioExceptionType.cancel:
        return 'Request Cancelled: The request was cancelled before completion.';
      default:
        return 'Unexpected Dio error occurred.';
    }
  }

}
