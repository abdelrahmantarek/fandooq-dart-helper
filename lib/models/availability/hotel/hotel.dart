
import 'package:fandooq_helper_package/models/availability/rate/rate.dart';

import '../../content/hotel.dart';
import '../booking/booking.dart';

part 'src/credit_card_model.dart';
part 'src/modification-policies.dart';
part 'src/room.dart';
part 'src/promotion.dart';


class HotelModel {

  final int code;

  final String? name;

  final String? categoryCode;

  final String? categoryName;

  final String? destinationCode;

  final String? checkIn;

  final String? checkOut;

  final String? destinationName;

  final int? zoneCode;

  final String? zoneName;

  final String? latitude;

  final String? longitude;

  final List<RoomModel> rooms;

  final String? minRate;

  final String? maxRate;

  final String? currency;

  final List<CreditCardModel> creditCards;

  bool isFavorite;

  bool isSynced;

  final String? totalNet;

  final bool paymentDataRequired;

  final ModificationPolicies? modificationPolicies;

  final int? exclusiveDeal;


  final HotelContent? content;



  HotelModel({
    required this.code,
    this.name,
    this.categoryCode,
    this.categoryName,
    this.destinationCode,
    this.destinationName,
    this.zoneCode,
    this.zoneName,
    this.latitude,
    this.longitude,
    this.rooms = const [],
    this.minRate,
    this.maxRate,
    this.currency,
    this.creditCards = const [],
    this.isFavorite = false,
    this.isSynced = false,
    this.totalNet,
    this.paymentDataRequired = false,
    this.modificationPolicies,
    this.exclusiveDeal,
    this.checkIn,
    this.checkOut,
    this.content,
  });

  factory HotelModel.fromJson(dynamic json){
    return HotelModel(
      code: json['code'],
      name: json['name'],
      checkIn: json['checkIn'],
      checkOut: json['checkOut'],
      categoryCode: json['categoryCode'],
      categoryName: json['categoryName'],
      destinationCode: json['destinationCode'],
      destinationName: json['destinationName'],
      zoneCode: json['zoneCode'],
      zoneName: json['zoneName'],
      latitude: json['latitude'].toString(),
      longitude: json['longitude'].toString(),
      rooms: List<RoomModel>.from(json['rooms'].map((x) => RoomModel.fromJson(x))),
      minRate: json['minRate'],
      maxRate: json['maxRate'],
      currency: json['currency'],
      creditCards:json['creditCards']!=null? List<CreditCardModel>.from(json['creditCards'].map((x) => CreditCardModel.fromJson(x))):[],
      isFavorite: json['is_favorite'] ?? false,
      isSynced: json['is_synced'] ?? false,
      totalNet: json['totalNet'],
      paymentDataRequired: json['paymentDataRequired'] ?? false,
      modificationPolicies: json['modificationPolicies'] != null
          ? ModificationPolicies.fromJson(json['modificationPolicies'])
          : null,
      exclusiveDeal: json['exclusiveDeal'],
    );
  }

  Map<String, dynamic> toJson({num commission = 0}) =>
      {
        'code': code,
        'name': name,
        'checkIn': checkIn,
        'checkOut': checkOut,
        'categoryCode': categoryCode,
        'categoryName': categoryName,
        'destinationCode': destinationCode,
        'destinationName': destinationName,
        'zoneCode': zoneCode,
        'zoneName': zoneName,
        'latitude': latitude,
        'longitude': longitude,
        'rooms': rooms.map((e) => e.toJson(commission: commission)).toList(),
        'minRate': minRate,
        'maxRate': maxRate,
        'currency': currency,
        'creditCards': creditCards.map((e) => e.toJson()).toList(),
        'is_favorite': isFavorite,
        'is_synced': isSynced,
        'totalNet': totalNet,
        'paymentDataRequired': paymentDataRequired,
        'modificationPolicies': modificationPolicies?.toJson(),
        'exclusiveDeal': exclusiveDeal,
      };

  HotelModel copyWith({
    int? code,
    String? name,
    String? categoryCode,
    String? categoryName,
    String? destinationCode,
    String? destinationName,
    int? zoneCode,
    String? zoneName,
    String? latitude,
    String? longitude,
    List<RoomModel>? rooms,
    String? minRate,
    String? maxRate,
    String? currency,
    List<CreditCardModel>? creditCards,
    bool? isFavorite,
    bool? isSynced,
    String? totalNet,
    bool? paymentDataRequired,
    ModificationPolicies? modificationPolicies,
    int? exclusiveDeal,
    String? checkIn,
    String? checkOut,
    HotelContent? content,
  }) {
    return HotelModel(
      code: code ?? this.code,
      name: name ?? this.name,
      categoryCode: categoryCode ?? this.categoryCode,
      categoryName: categoryName ?? this.categoryName,
      destinationCode: destinationCode ?? this.destinationCode,
      destinationName: destinationName ?? this.destinationName,
      zoneCode: zoneCode ?? this.zoneCode,
      zoneName: zoneName ?? this.zoneName,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      rooms: rooms ?? this.rooms,
      minRate: minRate ?? this.minRate,
      maxRate: maxRate ?? this.maxRate,
      currency: currency ?? this.currency,
      creditCards: creditCards ?? this.creditCards,
      isFavorite: isFavorite ?? this.isFavorite,
      isSynced: isSynced ?? this.isSynced,
      totalNet: totalNet ?? this.totalNet,
      paymentDataRequired: paymentDataRequired ?? this.paymentDataRequired,
      modificationPolicies: modificationPolicies ?? this.modificationPolicies,
      exclusiveDeal: exclusiveDeal ?? this.exclusiveDeal,
      checkIn: checkIn ?? this.checkIn,
      checkOut: checkOut ?? this.checkOut,
      content: content ?? this.content,
    );
  }



  @override
  bool operator ==(dynamic other) => identical(this, other) ||
      other is HotelModel &&
          runtimeType == other.runtimeType &&
          code == other.code;

  @override
  // TODO: implement hashCode
  int get hashCode => code.hashCode;

}