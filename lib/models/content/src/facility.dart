part of '../hotel.dart';


class Facility extends Searchable{


  final int? ageFrom;

  final int? ageTo;

  final num amount;

  final String? applicationType;

  final String? currency;

  final String? dateFrom;

  final String? dateTo;

  final ContentAndLanguage? description;

  final int? distance;

  final int? facilityCode;

  final int? facilityGroupCode;

  final String? facilityName;

  final bool indFee;

  final bool indLogic;

  final bool indYesOrNo;

  final int number;

  final int order;

  final String? timeFrom;

  final String? timeTo;

  final bool voucher;

  final String? icon;
  final bool mostPopular;

  Facility({
    this.ageFrom,
    this.ageTo,
    this.amount = 0,
    this.applicationType,
    this.currency,
    this.dateFrom,
    this.dateTo,
    this.description,
    this.distance,
    this.facilityCode,
    this.facilityGroupCode,
    this.facilityName,
    this.indFee = false,
    this.indLogic = false,
    this.indYesOrNo = false,
    this.number = 0,
    this.order = 0,
    this.timeFrom,
    this.timeTo,
    this.voucher = false,
    this.icon,
    this.mostPopular = false,
  });

  factory Facility.fromJson(dynamic json) {
    return Facility(
      ageFrom: json['ageFrom'],
      ageTo: json['ageTo'],
      amount: json['amount'] ?? 0,
      applicationType: json['applicationType'],
      currency: json['currency'],
      dateFrom: json['dateFrom'],
      dateTo: json['dateTo'],
      description: json['description'] != null ? ContentAndLanguage.fromJson(json['description']) : null,
      distance: json['distance'],
      facilityCode: json['facilityCode'] ?? json["code"],
      facilityGroupCode: json['facilityGroupCode'],
      facilityName: json['facilityName'],
      indFee: json['indFee'] ?? false,
      indLogic: json['indLogic'] ?? false,
      indYesOrNo: json['indYesOrNo'] ?? false,
      number: json['number'] ?? 0,
      order: json['order'] ?? 0,
      timeFrom: json['timeFrom'],
      timeTo: json['timeTo'],
      voucher: json['voucher'] ?? false,
      icon: json['icon'],
      mostPopular: json['mostPopular'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ageFrom': ageFrom,
      'ageTo': ageTo,
      'amount': amount,
      'applicationType': applicationType,
      'currency': currency,
      'dateFrom': dateFrom,
      'dateTo': dateTo,
      'description': description?.toJson(),
      'distance': distance,
      'facilityCode': facilityCode,
      'facilityGroupCode': facilityGroupCode,
      'facilityName': facilityName,
      'indFee': indFee,
      'indLogic': indLogic,
      'indYesOrNo': indYesOrNo,
      'number': number,
      'order': order,
      'timeFrom': timeFrom,
      'timeTo': timeTo,
      'voucher': voucher,
      'icon': icon,
      'mostPopular': mostPopular,
    };
  }

  Facility copyWith({
    int? ageFrom,
    int? ageTo,
    num? amount,
    String? applicationType,
    String? currency,
    String? dateFrom,
    String? dateTo,
    ContentAndLanguage? description,
    int? distance,
    int? facilityCode,
    int? facilityGroupCode,
    String? facilityName,
    bool? indFee,
    bool? indLogic,
    bool? indYesOrNo,
    int? number,
    int? order,
    String? timeFrom,
    String? timeTo,
    bool? voucher,
    String? icon,
    bool? mostPopular,
  }) {
    return Facility(
      ageFrom: ageFrom ?? this.ageFrom,
      ageTo: ageTo ?? this.ageTo,
      amount: amount ?? this.amount,
      applicationType: applicationType ?? this.applicationType,
      currency: currency ?? this.currency,
      dateFrom: dateFrom ?? this.dateFrom,
      dateTo: dateTo ?? this.dateTo,
      description: description ?? this.description,
      distance: distance ?? this.distance,
      facilityCode: facilityCode ?? this.facilityCode,
      facilityGroupCode: facilityGroupCode ?? this.facilityGroupCode,
      facilityName: facilityName ?? this.facilityName,
      indFee: indFee ?? this.indFee,
      indLogic: indLogic ?? this.indLogic,
      indYesOrNo: indYesOrNo ?? this.indYesOrNo,
      number: number ?? this.number,
      order: order ?? this.order,
      timeFrom: timeFrom ?? this.timeFrom,
      timeTo: timeTo ?? this.timeTo,
      voucher: voucher ?? this.voucher,
      icon: icon ?? this.icon,
      mostPopular: mostPopular ?? this.mostPopular,
    );
  }

  @override
  int get hashCode => facilityGroupCode.hashCode + facilityCode.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Facility &&
        other.facilityGroupCode == facilityGroupCode && other.facilityCode == facilityCode;
  }




  String get restOfDetails{

    List<String> list = [];

    if(isCarPark){

      if(indYesOrNo){

        list.add("YES");

        if(indFee){
          list.add("(With additional debit notes)");
        }

        if(!indFee){
          list.add("(Without additional debit notes)");
        }

        if(amount > 0 && indFee){
          list.add(amount.toString());
        }

      }else{
        list.add("NO");
      }

    }else{

      if(timeFrom != null){
        list.add("( $timeFrom )");
      }

      if(timeTo != null){
        list.add("( $timeTo )");
      }

      if(amount > 0){
        list.add("(With additional debit notes) ${amount.toString()}");
      }

      if(number > 0){
        list.add("$number");
      }

    }

    return list.join(" ");
  }


  @override
  String get getText {
    // TODO: implement getText
    return description?.content ?? "";
  }


  //
  // String? get getIcon {
  //   var data = facilitiesAr.lookup(this);
  //   if(data?.icon != null) return "assets/facilities/${data?.icon}";
  //   return null;
  // }


  bool get isWifi => facilityCode == 550 && facilityGroupCode == 70;
  bool get isBreakfast => facilityCode == 40 && facilityGroupCode == 80;
  bool get isRoomsWifi => facilityCode == 261 && facilityGroupCode == 60;
  bool get isRoomSize => facilityCode == 295 && facilityGroupCode == 60;
  bool get checkIn => facilityCode == 260 && facilityGroupCode == 70;
  bool get checkOut => facilityCode == 390 && facilityGroupCode == 70;
  bool get isCarPark => facilityCode == 320 && facilityGroupCode == 70;

  bool get isCarParkYes => facilityCode == 996 && facilityGroupCode == 70;
  bool get isCarParkNo => facilityCode == 997 && facilityGroupCode == 70;


  bool get isMostPopular {
    return (facilityCode == 11 && facilityGroupCode == 60) ||
        (facilityCode == 115 && facilityGroupCode == 60) ||
        (facilityCode == 124 && facilityGroupCode == 10) ||
        (facilityCode == 125 && facilityGroupCode == 70) ||
        (facilityCode == 130 && facilityGroupCode == 71) ||
        (facilityCode == 131 && facilityGroupCode == 10) ||
        (facilityCode == 143 && facilityGroupCode == 60) ||
        (facilityCode == 145 && facilityGroupCode == 60) ||
        (facilityCode == 200 && facilityGroupCode == 71) ||
        (facilityCode == 220 && facilityGroupCode == 71) ||
        (facilityCode == 261 && facilityGroupCode == 60) ||
        (facilityCode == 270 && facilityGroupCode == 70) ||
        (facilityCode == 295 && facilityGroupCode == 90) ||
        (facilityCode == 30 && facilityGroupCode == 20)||
        (facilityCode == 306 && facilityGroupCode == 60) ||
        (facilityCode == 313 && facilityGroupCode == 60) ||
        (facilityCode == 320 && facilityGroupCode == 70) ||
        (facilityCode == 40 && facilityGroupCode == 80) ||
        // (facilityCode == 550 && facilityGroupCode == 70) ||
        (facilityCode == 620 && facilityGroupCode == 74);
  }

  String get getIcon {
    if (facilityCode == 11 && facilityGroupCode == 60) return "assets/facilities/private_bath_room.svg";
    if (facilityCode == 115 && facilityGroupCode == 60) return "assets/facilities/kitchen.svg";
    if (facilityCode == 124 && facilityGroupCode == 10) return "assets/facilities/disability_friendly.svg";
    if (facilityCode == 125 && facilityGroupCode == 70) return "assets/facilities/garden.svg";
    if (facilityCode == 130 && facilityGroupCode == 71) return "assets/facilities/bar.svg";
    if (facilityCode == 131 && facilityGroupCode == 10) return "assets/facilities/family_rooms.svg";
    if (facilityCode == 143 && facilityGroupCode == 60) return "assets/facilities/coffee_maker.svg";
    if (facilityCode == 145 && facilityGroupCode == 60) return "assets/facilities/washing_machine.svg";
    if (facilityCode == 200 && facilityGroupCode == 71) return "assets/facilities/restaurant.svg";
    if (facilityCode == 220 && facilityGroupCode == 71) return "assets/facilities/non_smoking.svg";
    if (facilityCode == 261 && facilityGroupCode == 60) return "assets/facilities/wifi.svg";
    if (facilityCode == 270 && facilityGroupCode == 70) return "assets/facilities/roomServices.svg";
    if (facilityCode == 295 && facilityGroupCode == 90) return "assets/facilities/fitness.svg";
    if (facilityCode == 30 && facilityGroupCode == 20) return "assets/facilities/apartment.svg";
    if (facilityCode == 306 && facilityGroupCode == 60) return "assets/facilities/pool.svg";
    if (facilityCode == 313 && facilityGroupCode == 60) return "assets/facilities/pool.svg";
    if (facilityCode == 320 && facilityGroupCode == 70) return "assets/facilities/parking.svg";
    if (facilityCode == 40 && facilityGroupCode == 80) return "assets/facilities/breakfast.svg";
    // if (facilityCode == 550 && facilityGroupCode == 70) return "assets/facilities/wifi.svg";
    if (facilityCode == 620 && facilityGroupCode == 74) return "assets/facilities/spa.svg";
    return "";
  }

  String get queryBox{
    return '$facilityCode$facilityGroupCode';
  }

}







