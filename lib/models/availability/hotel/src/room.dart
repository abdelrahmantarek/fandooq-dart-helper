part of '../hotel.dart';

class RoomModel {

  final String? code;

  final String? name;

  final List<Rate>? rates;

  final String? status;

  final int? id;

  final List<Pax>? paxes;


  RoomModel({
    this.code,
    this.name,
    this.rates,
    this.status,
    this.id,
    this.paxes,
  });

  bool contain({required int children,required int adults,required int rooms}){
    return (rates ?? []).where((element) =>
    element.children == children &&
        element.adults == adults &&
        element.rooms == rooms).isNotEmpty;
  }

  RoomModel.fromJson(dynamic json)
      : code = json['code'],
        name = json['name'],
        rates = ((json['rates'] ?? []) as List).map((e) => Rate.fromJson(e,json["code"].toString())).toList(),
        status = json['status'],
        id =json['id'],
        paxes = json['paxes'] != null ? List<Pax>.from(json['paxes'].map((x) => Pax.fromJson(x))) : null;

  Map<String, dynamic> toJson({num commission = 0}) => {
    'code': code,
    'name': name,
    'rates': rates?.map((e) => e.toJson(commission: commission)).toList(),
    'status': status,
    'id': id,
    'paxes': paxes?.map((x) => x.toJson()).toList(),
  };

  RoomModel copyWith({
    String? code,
    String? name,
    List<Rate>? rates,
    List<Pax>? paxes,
    int? id,
    String? status,
  }) {
    return RoomModel(
      code: code ?? this.code,
      name: name ?? this.name,
      rates: rates ?? this.rates,
      id: id ?? this.id,
      status: status ?? this.status,
      paxes: paxes ?? this.paxes,
    );
  }

  bool get hasFreeCancellation {
    return (rates ?? []).any((rate) => rate.hasFreeCancellation);
  }

  bool get breakfastInclude {
    return (rates ?? []).any((rate) => rate.boardCode?.toUpperCase() == "BB");
  }

}