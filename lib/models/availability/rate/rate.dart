
import 'package:collection/collection.dart';
import 'package:fandooq_helper_package/core/const/app.dart';
import 'package:fandooq_helper_package/core/ex/hotels.dart';

import '../hotel/hotel.dart';

part 'src/cancellation_policy.dart';
part 'src/offer.dart';
part 'src/rate_break_down.dart';
part 'src/rate_discount.dart';
part 'src/rate_tax.dart';
part 'src/pax.dart';


class Rate {


  final String? rateClass;

  final String? net;

  final String? rateComments;

  final String? paymentType;

  final bool? packaging;

  final String? boardCode;

  final String? boardName;

  final List<CancellationPolicy>? cancellationPolicies;

  final int? rooms;

  final num sellPrice;

  final int? adults;

  final int? children;

  final String? rateKey;

  final String? rateType;

  final int? allotment;

  final RateBreakDown? rateBreakDown;

  final List<Offer>? offers;

  final String? rateCommentsId;

  final String? sellingRate;

  final Taxes? taxes;

  final RoomModel? roomModel;

  final int roomId;

  final List<Promotion>? promotions;

  final String? roomCode;


  bool get showAllotment{
    return (allotment ?? 0) < 5 && (allotment ?? 0) > 0;
  }

  // String get rateCommentsShort {
  //   String text = rateComments ?? '';
  //
  //
    // قائمة بالكلمات المفتاحية
  //   List<String> keywords = [
  //     'Check-in is any time after',
  //     'Pool Heat:',
  //     'Kissimmee Rental Items:',
  //     'Estimated total amount of taxes & fees for this booking:',
  //     'Key Collection',
  //     'Car park',
  //     'Check-in hour',
  //     'Identification card at arrival',
  //     'Minimum check-in age',
  //     'Online check-in',
  //     'Self check-in',
  //     'After hours / emergency:',
  //     'Phone:',
  //     'Check-out time is',
  //     'Photo ID and a major credit card are required at registration',
  //     'For arrivals after hours, collect welcome pack from the lockbox at the front door of the office',
  //     'Please note all guests must register with the office by noon the day after arrival'
  //   ];
  //
  //   // إنشاء تعبير منتظم يتضمن الكلمات المفتاحية
  //   String pattern = keywords.map((keyword) => RegExp.escape(keyword)).join('|');
  //   RegExp regExp = RegExp(pattern);
  //
  //   // قائمة لتخزين الأقسام
  //   List<Map<String, String>> sections = [];
  //
  //   // مؤشر لآخر موقع تم فحصه
  //   int lastIndex = 0;
  //
  //   // العثور على جميع المطابقات
  //   Iterable<RegExpMatch> matches = regExp.allMatches(text);
  //
  //   for (final match in matches) {
  //     String keyword = match.group(0)!;
  //     int startIndex = match.start;
  //
  //     // الحصول على المحتوى قبل الكلمة المفتاحية
  //     if (startIndex > lastIndex) {
  //       String content = text.substring(lastIndex, startIndex).trim();
  //       if (content.isNotEmpty && sections.isNotEmpty) {
  //         sections.last['content'] = (sections.last['content'] ?? '') + ' ' + content;
  //       }
  //     }
  //
  //     // بدء قسم جديد
  //     sections.add({'title': keyword, 'content': ''});
  //
  //     // تحديث مؤشر آخر موقع
  //     lastIndex = match.end;
  //   }
  //
  //   // إضافة أي محتوى متبقي
  //   if (lastIndex < text.length) {
  //     String content = text.substring(lastIndex).trim();
  //     if (content.isNotEmpty) {
  //       if (sections.isNotEmpty) {
  //         sections.last['content'] = (sections.last['content'] ?? '') + ' ' + content;
  //       } else {
  //         sections.add({'title': 'Content', 'content': content});
  //       }
  //     }
  //   }
  //
  //
  //   // إرجاع المحتوى المجمع
  //   return sections.map((section) => '${section['title']} ${section['content']}\n').join("\n");
  // }



  String get rateCommentsShort{
    String text = rateComments ?? '';
    return text.split(". ").map((e)=>e.trim()).join("\n\n");
  }

  List<String> get rateCommentsFull{
    String text = rateComments ?? '';
    return text.split(". ").map((e)=>e.trim()).toList();
  }

  Rate({
    required this.rateClass,
    required this.net,
    required this.rateComments,
    required this.paymentType,
    required this.packaging,
    required this.boardCode,
    required this.boardName,
    required this.cancellationPolicies,
    required this.rooms,
    required this.adults,
    required this.children,
    this.rateKey,
    this.rateType,
    this.allotment,
    this.rateBreakDown,
    this.offers,
    this.roomModel,
    this.roomId = 1,
    this.rateCommentsId,
    this.taxes,
    this.promotions,
    this.roomCode,
    this.sellingRate,
    this.sellPrice = 0,
  });

  factory Rate.fromJson(Map<String, dynamic> json,[String? roomCode]){
    return Rate(
      rateClass: json['rateClass'],
      net: json['net'],
      rateComments: json['rateComments'],
      paymentType: json['paymentType'],
      packaging: json['packaging'],
      boardCode: json['boardCode'],
      boardName: json['boardName'],
      cancellationPolicies: ((json['cancellationPolicies'] ?? []) as List).map((x) => CancellationPolicy.fromJson(x)).toList(),
      rooms: json['rooms'],
      adults: json['adults'],
      children: json['children'],
      rateKey: json['rateKey'],
      rateCommentsId: json['rateCommentsId'],
      rateType: json['rateType'],
      allotment: json['allotment'],
      sellingRate: json['sellingRate'],
      sellPrice: num.parse(json['sellPrice'] ?? "0"),
      roomCode: roomCode,
      offers: ((json['offers'] ?? []) as List).map((x) => Offer.fromJson(x)).toList(),
      promotions: ((json['promotions'] ?? []) as List).map((x) => Promotion.fromJson(x)).toList(),
      taxes: json['taxes'] != null ? Taxes.fromJson(json["taxes"]) : null,
      rateBreakDown: json['rateBreakDown'] != null ? RateBreakDown.fromJson(json["rateBreakDown"]) : null,
    );
  }


  Map<String, dynamic> toJson({num commission = 0}) => {
    'rateClass': rateClass,
    'net': net,
    'sellingRate': sellingRate,
    'sellPrice': _buildSellRate(commission: commission),
    'rateComments': rateComments,
    'paymentType': paymentType,
    'packaging': packaging,
    'boardCode': boardCode,
    'boardName': boardName,
    'cancellationPolicies': cancellationPolicies?.map((x) => x.toJson()).toList(),
    'rooms': rooms,
    'adults': adults,
    'children': children,
    'rateKey': rateKey,
    'rateType': rateType,
    'allotment': allotment,
    'rateCommentsId': rateCommentsId,
    'offers': offers?.map((x) => x.toJson()).toList(),
    'promotions': promotions?.map((x) => x.toJson()).toList(),
    'taxes': taxes?.toJson(),
    'roomCode': roomCode,
    'rateBreakDown': rateBreakDown?.toJson(),
  };

  Map<String, dynamic> toJsonOption1({num commission = 0}) => {
    'net': net,
    'sellingRate': sellingRate,
    'sellPrice': _buildSellRate(commission: commission),
    'boardCode': boardCode,
    'boardName': boardName,
    'cancellationPolicies': cancellationPolicies?.map((x) => x.toJson()).toList(),
    'rooms': rooms,
    'adults': adults,
    'children': children,
    'allotment': allotment,
    'offers': offers?.map((x) => x.toJson()).toList(),
    'promotions': promotions?.map((x) => x.toJson()).toList(),
    'taxes': taxes?.toJson(),
    'roomCode': roomCode,
    'rateBreakDown': rateBreakDown?.toJson(),
  };


  String toJsonCompress({num commission = 0}) {
    return [
          rateClass,
          net,
          sellingRate,
          _buildSellRate(commission: commission),
          rateComments,
          paymentType,
          packaging,
          boardCode,
          boardName,
          cancellationPolicies?.map((x) => x.toJsonCompress()).toRed("Cancellation"),
          rooms,
          adults,
          children,
          rateKey,
          rateType,
          allotment,
          rateCommentsId,
          offers?.map((x) => x.toJsonCompress()).toRed("Offers"),
          promotions?.map((x) => x.toJsonCompress()).toRed("Promotions"),
          taxes?.toJsonCompress(),
          roomCode,
          rateBreakDown?.toJsonCompress(),
        ].join(",");
  }

  String _buildSellRate({num commission = 0}){
    var netPrice = num.parse(net ?? "0");
    var sellingPrice = num.parse(sellingRate ?? "0");
    if(sellingPrice > netPrice){
      return Consts.commission(sellingPrice,commission).toString();
    }
    return Consts.commission(netPrice,commission).toString();
  }

  Rate copyCheckRate({
    RoomModel? roomModel,
    int? roomId,
  }) {
    return copyWith(
      roomModel: roomModel ?? this.roomModel,
      roomId: roomId ?? this.roomId,
    );
  }


  Rate copyWith({
    String? rateClass,
    String? net,
    String? rateComments,
    String? paymentType,
    bool? packaging,
    String? boardCode,
    String? boardName,
    List<CancellationPolicy>? cancellationPolicies,
    int? rooms,
    int? adults,
    int? children,
    String? rateKey,
    String? rateType,
    int? allotment,
    RateBreakDown? rateBreakDown,
    List<Offer>? offers,
    List<Promotion>? promotions,
    RoomModel? roomModel,
    int? roomId,
    String? rateCommentsId,
    String? roomCode,
    String? sellingRate,
    num? sellPrice,
    Taxes? taxes,
  }) {
    return Rate(
      rateClass: rateClass ?? this.rateClass,
      net: net ?? this.net,
      rateComments: rateComments ?? this.rateComments,
      paymentType: paymentType ?? this.paymentType,
      packaging: packaging ?? this.packaging,
      boardCode: boardCode ?? this.boardCode,
      boardName: boardName ?? this.boardName,
      cancellationPolicies: cancellationPolicies ?? this.cancellationPolicies,
      rooms: rooms ?? this.rooms,
      adults: adults ?? this.adults,
      children: children ?? this.children,
      rateKey: rateKey ?? this.rateKey,
      rateType: rateType ?? this.rateType,
      allotment: allotment ?? this.allotment,
      rateBreakDown: rateBreakDown ?? this.rateBreakDown,
      offers: offers ?? this.offers,
      promotions: promotions ?? this.promotions,
      roomModel: roomModel ?? this.roomModel,
      roomId: roomId ?? this.roomId,
      rateCommentsId: rateCommentsId ?? this.rateCommentsId,
      roomCode: roomCode ?? this.roomCode,
      taxes: taxes ?? this.taxes,
      sellingRate: sellingRate ?? this.sellingRate,
      sellPrice: sellPrice ?? this.sellPrice,
    );
  }

  bool contain({required int children,required int adults,required int rooms}){
    return this.children == children &&
        this.adults == adults &&
        this.rooms == rooms;
  }

  bool get hasFreeCancellation{
    return (cancellationPolicies ?? []).any((element) => element.date.isAfter(DateTime.now()));
  }

  bool get nonRefund {
    return !hasFreeCancellation;
  }

  bool get hasBreakfast => boardCode == "BB";

  CancellationPolicy? get nearestCancellationPolicy {
    if (cancellationPolicies == null || (cancellationPolicies ?? []).isEmpty) {
      return null;
    }

    // تصفية السياسات بحيث تكون التواريخ بعد اليوم
    List<CancellationPolicy> validPolicies = (cancellationPolicies ?? []).where((element) => element.date.isAfter(DateTime.now())).toList();

    if (validPolicies.isEmpty) {
      return null;
    }

    // إيجاد أقرب سياسة
    validPolicies.sort((a, b) => a.date.compareTo(b.date));
    return validPolicies.first;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    final Rate otherRate = other as Rate;
    return rateKey == otherRate.rateKey;
  }

  @override
  int get hashCode {
    return rateKey.hashCode;
  }

}