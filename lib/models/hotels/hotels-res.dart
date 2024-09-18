import 'package:fandooq_helper_package/models/availability/rate/rate.dart';
import 'package:fandooq_helper_package/models/utils/hotel.dart';

// class HotelsRes {
//
//   final num code;
//   final String name;
//   final String address;
//   final num rating;
//   final String? cancellation;
//   final String? offers;
//   final String? promotions;
//   final num excludeTaxPrice;
//   final num includeTaxPrice;
//   final num lat;
//   final num lng;
//   final int? order;
//   final bool freeCancellation;
//   final bool breakfastInclude;
//   final Rate minRate;
//   final String currency;
//
//   HotelsRes({
//     required this.code,
//     required this.name,
//     required this.address,
//     this.rating = 0,
//     required this.cancellation,
//     required this.offers,
//     required this.promotions,
//     this.excludeTaxPrice = 0,
//     this.includeTaxPrice = 0,
//     this.lat = 0,
//     this.lng = 0,
//     required this.order,
//     this.freeCancellation = false,
//     this.breakfastInclude = false,
//     required this.minRate,
//     required this.currency,
//   });
//
//
//   factory HotelsRes.fromHotelData(json){
//     return HotelsRes(
//         code: json["code"],
//         name: json["name"],
//         address: json["address"],
//         rating: HotelUtils.getRatingStar(json["categoryCode"]),
//         cancellation: cancellation,
//         offers: offers,
//         promotions: promotions,
//         excludeTaxPrice: excludeTaxPrice,
//         includeTaxPrice: includeTaxPrice,
//         lat: json["latitude"],
//         lng: json["longitude"],
//         order: json["exclusiveDeal"],
//         freeCancellation: HotelUtils.hasFreeCancellation(json),
//         breakfastInclude: breakfastInclude,
//         minRate: minRate,
//         currency: currency
//     );
//   }
//
//   // fromJson method
//   factory HotelsRes.fromJson(Map<String, dynamic> json) {
//     return HotelsRes(
//       code: json['code'],
//       name: json['name'],
//       address: json['address'],
//       rating: json['rating'],
//       cancellation: json['cancellation'],
//       offers: json['offers'],
//       promotions: json['promotions'],
//       excludeTaxPrice: json['excludeTaxPrice'],
//       includeTaxPrice: json['includeTaxPrice'],
//       order: json['order'],
//       freeCancellation: json['freeCancellation'],
//       breakfastInclude: json['breakfastInclude'],
//       minRate: RatePrice.fromJson(json['minRate']),
//       currency: json['currency'],
//     );
//   }
//
//   // toJson method
//   Map<String, dynamic> toJson() {
//     return {
//       'code': code,
//       'name': name,
//       'address': address,
//       'rating': rating,
//       'cancellation': cancellation,
//       'offers': offers,
//       'promotions': promotions,
//       'excludeTaxPrice': excludeTaxPrice,
//       'includeTaxPrice': includeTaxPrice,
//       'order': order,
//       'freeCancellation': freeCancellation,
//       'breakfastInclude': breakfastInclude,
//       'minRate': minRate.toJson(),
//       'currency': currency,
//     };
//   }
//
// }

// class RatePrice {
//
//   final String board;
//   final String minPrice;
//   final num leftCount;
//   final List<CancellationPolicy> ;
//
//   RatePrice({required this.board, required this.minPrice, required this.leftCount});
//
//   // fromJson method
//   factory RatePrice.fromJson(Map<String, dynamic> json) {
//     return RatePrice(
//       board: json['board'],
//       minPrice: json['minPrice'],
//       leftCount: json['leftCount'],
//     );
//   }
//
//   // toJson method
//   Map<String, dynamic> toJson() {
//     return {
//       'board': board,
//       'minPrice': minPrice,
//       'leftCount': leftCount,
//     };
//   }
//
// }