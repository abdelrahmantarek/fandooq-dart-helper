part of '../hotel.dart';


class ContentAndLanguage {

  final String? content;

  final String? languageCode;

  String? ar;

  ContentAndLanguage({required this.content, required this.languageCode, this.ar});

  factory ContentAndLanguage.fromJson(dynamic json) {
    return ContentAndLanguage(
      content: json?['content'],
      languageCode: json?['languageCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'languageCode': languageCode,
    };
  }

  ContentAndLanguage copyWith({String? content, String? languageCode, String? ar}) {
    return ContentAndLanguage(
      content: content ?? this.content,
      languageCode: languageCode ?? this.languageCode,
      ar: ar ?? this.ar,
    );
  }

  String get fullText{
    return (ar ?? "") + (content ?? "");
  }

  String get getContent{
    return (content ?? "");
  }

  @override
  int get hashCode => content.hashCode ^ languageCode.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ContentAndLanguage &&
        other.content == content &&
        other.languageCode == languageCode;
  }
}