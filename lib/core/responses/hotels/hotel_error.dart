

class ErrorHotel {

  final int code;

  final String message;

  ErrorHotel({
    required this.code,
    required this.message,
  });

  ErrorHotel copyWith({
    int? code,
    String? message,
  }) {
    return ErrorHotel(
      code: code ?? this.code,
      message: message ?? this.message,
    );
  }

  factory ErrorHotel.fromJson(dynamic json) {
    return ErrorHotel(
      code: json['code'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'message': message,
    };
  }

  @override
  int get hashCode => code.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ErrorHotel && other.code == code;
  }

}
