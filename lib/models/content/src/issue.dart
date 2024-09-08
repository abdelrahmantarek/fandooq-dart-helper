part of '../hotel.dart';


class Issue {


  final bool? alternative;


  final String? dateFrom;


  final String? dateTo;


  final ContentAndLanguage? description;


  final String? issueCode;


  final String? issueType;


  final int? order;

  Issue({
    required this.alternative,
    required this.dateFrom,
    required this.dateTo,
    required this.description,
    required this.issueCode,
    required this.issueType,
    required this.order,
  });

  factory Issue.fromJson(dynamic json) {
    return Issue(
      alternative: json['alternative'],
      dateFrom: json['dateFrom'],
      dateTo: json['dateTo'],
      description: json['description'] != null ? ContentAndLanguage.fromJson(json['description'] as Map<String, dynamic>) : null,
      issueCode: json['issueCode'],
      issueType: json['issueType'],
      order: json['order'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'alternative': alternative,
      'dateFrom': dateFrom,
      'dateTo': dateTo,
      'description': description?.toJson(),
      'issueCode': issueCode,
      'issueType': issueType,
      'order': order,
    };
  }

  Issue copyWith({
    bool? alternative,
    String? dateFrom,
    String? dateTo,
    ContentAndLanguage? description,
    String? issueCode,
    String? issueType,
    int? order,
  }) {
    return Issue(
      alternative: alternative ?? this.alternative,
      dateFrom: dateFrom ?? this.dateFrom,
      dateTo: dateTo ?? this.dateTo,
      description: description ?? this.description,
      issueCode: issueCode ?? this.issueCode,
      issueType: issueType ?? this.issueType,
      order: order ?? this.order,
    );
  }

  @override
  int get hashCode => alternative.hashCode ^ dateFrom.hashCode ^ dateTo.hashCode ^ description.hashCode ^ issueCode.hashCode ^ issueType.hashCode ^ order.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Issue &&
        other.alternative == alternative &&
        other.dateFrom == dateFrom &&
        other.dateTo == dateTo &&
        other.description == description &&
        other.issueCode == issueCode &&
        other.issueType == issueType &&
        other.order == order;
  }
}
