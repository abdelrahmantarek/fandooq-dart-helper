
part of '../hotel.dart';

class RateComment{

  int incoming;
  int hotel;
  String code;
  List<CommentByRate> commentsByRates;

  bool contain(String rateCommentId){
    var split = rateCommentId.split("|");
    var incoming = split[0];
    var code = split[1];
    return this.incoming.toString() == incoming.toString() && this.code.toString() == code.toString();
  }

  RateComment({required this.incoming, required this.hotel, required this.code, required this.commentsByRates});

  factory RateComment.fromJson(dynamic json) {
    return RateComment(
      incoming: json['incoming'],
      hotel: json['hotel'],
      code: json['code'],
      commentsByRates: List<CommentByRate>.from(json['commentsByRates'].map((x) => CommentByRate.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'incoming': incoming,
      'hotel': hotel,
      'code': code,
      'commentsByRates': List<dynamic>.from(commentsByRates.map((x) => x.toJson())),
    };
  }

}

class CommentByRate {
  List<int> rateCodes;
  List<Comment> comments;

  CommentByRate({required this.rateCodes, required this.comments});

  factory CommentByRate.fromJson(dynamic json) {
    return CommentByRate(
      rateCodes: List<int>.from(json['rateCodes'].map((x) => x)),
      comments: List<Comment>.from(json['comments'].map((x) => Comment.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rateCodes': List<dynamic>.from(rateCodes.map((x) => x)),
      'comments': List<dynamic>.from(comments.map((x) => x.toJson())),
    };
  }
}

class Comment {
  DateTime dateEnd;
  DateTime dateStart;
  String description;

  Comment({required this.dateEnd, required this.dateStart, required this.description});

  factory Comment.fromJson(dynamic json) {
    return Comment(
      dateEnd: DateTime.parse(json['dateEnd']),
      dateStart: DateTime.parse(json['dateStart']),
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dateEnd': dateEnd.toIso8601String(),
      'dateStart': dateStart.toIso8601String(),
      'description': description,
    };
  }
}
