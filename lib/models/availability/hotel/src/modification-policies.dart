
part of '../hotel.dart';

class ModificationPolicies {

  final bool cancellation;

  final bool modification;

  ModificationPolicies({
    required this.cancellation,
    required this.modification,
  });

  factory ModificationPolicies.fromJson(dynamic json) {
    return ModificationPolicies(
      cancellation: json['cancellation'] ?? false,
      modification: json['modification'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cancellation': cancellation,
      'modification': modification,
    };
  }

  String toJsonCompress() {
    return [
      cancellation,
      modification,
    ].join(",");
  }

}
