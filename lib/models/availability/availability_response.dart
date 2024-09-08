


import 'hotel/hotel.dart';

class AvailabilityResponse {

  final List<HotelAvailabilityModel> hotelList;

  final String? checkIn;

  final int? total;

  final String? checkOut;

  AvailabilityResponse({
    this.hotelList = const [],
    this.checkIn,
    this.total = 0,
    this.checkOut,
  });

  factory AvailabilityResponse.fromJson(Map<String, dynamic> json) {
    return _fromJson(json);
  }

  static AvailabilityResponse _fromJson(Map<String, dynamic> json){
    var hotelsJson = json['hotels'];
    if(hotelsJson == null){
      return AvailabilityResponse(hotelList: []);
    }
    return AvailabilityResponse(
        hotelList: json['hotels']['hotels'] != null ? (json['hotels']['hotels'] as List).map((e) => HotelAvailabilityModel.fromJson(e)).toList() : [],
        checkIn: json['hotels']['checkIn'],
        total: json['hotels']['total'],
        checkOut: json['hotels']['checkOut']);
  }

  @override
  AvailabilityResponse fromJson(Map<String, dynamic> json) {
    return _fromJson(json);
  }

  Map<String, dynamic> toJson() => {
        'hotels': hotelList.map((e) => e.toJson()).toList(),
        'checkIn': checkIn,
        'total': total,
        'checkOut': checkOut,
      };

  AvailabilityResponse copyWith({
    List<HotelAvailabilityModel>? hotelList,
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
