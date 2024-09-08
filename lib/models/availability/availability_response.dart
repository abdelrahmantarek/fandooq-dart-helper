
import 'package:fandooq_helper_package/core/network_provider/networking.dart';

import 'hotel/hotel.dart';


class AvailabilityResponse extends BaseMappable{

  final List<HotelModel> hotelList;

  final String? checkIn;

  final int? total;

  final String? checkOut;

  AvailabilityResponse({
    this.hotelList = const [],
    this.checkIn,
    this.total = 0,
    this.checkOut,
  });

  factory AvailabilityResponse.fromJson(dynamic json) {
    return _fromJson(json);
  }

  static AvailabilityResponse _fromJson(dynamic json){
    var hotelsJson = json['hotels'];
    if(hotelsJson == null){
      return AvailabilityResponse(hotelList: []);
    }
    return AvailabilityResponse(
        hotelList: json['hotels'] != null ? (json['hotels'] as List).map((e) => HotelModel.fromJson(e)).toList() : [],
        checkIn: json['checkIn'],
        total: json['total'],
        checkOut: json['checkOut']);
  }

  static AvailabilityResponse fromHotelBeds(dynamic json){
    var hotelsJson = json['hotels'];
    if(hotelsJson == null){
      return AvailabilityResponse(hotelList: []);
    }
    return AvailabilityResponse(
        hotelList: json["hotels"]['hotels'] != null ? (json["hotels"]['hotels'] as List).map((e) => HotelModel.fromJson(e)).toList() : [],
        checkIn: json["hotels"]['checkIn'],
        total: json["hotels"]['total'],
        checkOut: json["hotels"]['checkOut']);
  }

  @override
  AvailabilityResponse fromJson(dynamic json) {
    return _fromJson(json);
  }

  Map<String, dynamic> toJson({num commission = 0}) => {
        'hotels': hotelList.map((e) => e.toJson(commission: commission)).toList(),
        'checkIn': checkIn,
        'total': total,
        'checkOut': checkOut,
      };


  AvailabilityResponse copyWith({
    List<HotelModel>? hotelList,
    String? checkIn,
    int? total,
    String? checkOut,
  }) {
    return AvailabilityResponse(
      hotelList: hotelList ?? this.hotelList,
      checkIn: checkIn ?? this.checkIn,
      total: total ?? this.total,
      checkOut: checkOut ?? this.checkOut,
    );
  }


}
