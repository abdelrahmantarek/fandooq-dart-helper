part of '../hotel.dart';


class HotelContent{


  final String? S2C;


  final AccommodationType? accommodationType;


  final String? accommodationTypeCode;


  final ContentAndLanguage? address;


  final List<String>? boardCodes;


  final List<Board>? boards;


  final Category? category;


  final String? categoryCode;


  final CategoryGroup? categoryGroup;


  final String? categoryGroupCode;


  final Chain? chain;


  final String? chainCode;


  final ContentAndLanguage? city;


  final int? code;


  final Coordinates? coordinates;


  final Country? country;


  final String? countryCode;


  final ContentAndLanguage? description;


  final Destination? destination;


  final String? destinationCode;


  final String? email;


  final int? exclusiveDeal;


  final List<Facility>? facilities;


  final int? giataCode;


  final List<ImageHotel> images;


  final List<InterestPoint>? interestPoints;


  final List<Issue>? issues;


  final String? lastUpdate;


  final String? license;


  final ContentAndLanguage? name;


  final List<Phone>? phones;


  final String? postalCode;


  final int? ranking;


  final List<RoomContent>? rooms; // تأكد من تعريف _Room


  final List<int>? segmentCodes;


  final List<Segment>? segments; // تأكد من تعريف Segment


  final StateContent? state; // تأكد من تعريف State


  final String? stateCode;


  final List<Terminal>? terminals; // تأكد من تعريف Terminal


  final String? web;


  final List<Wildcard>? wildcards; // تأكد من تعريف Wildcard


  final ZoneD? zone; // تأكد من تعريف ZoneD


  final int? zoneCode;


  HotelContent({
     this.S2C,
     this.accommodationType,
     this.accommodationTypeCode,
     this.address,
     this.boardCodes,
     this.boards,
     this.category,
     this.categoryCode,
     this.categoryGroup,
     this.categoryGroupCode,
     this.chain,
     this.chainCode,
     this.city,
     this.code,
     this.coordinates,
     this.country,
     this.countryCode,
     this.description,
     this.destination,
     this.destinationCode,
     this.email,
     this.exclusiveDeal,
     this.facilities,
     this.giataCode,
     this.images = const [],
     this.interestPoints,
     this.issues,
     this.lastUpdate,
     this.license,
     this.name,
     this.phones,
     this.postalCode,
     this.ranking,
     this.rooms,
     this.segmentCodes,
     this.segments,
     this.state,
     this.stateCode,
     this.terminals,
     this.web,
     this.wildcards,
     this.zone,
     this.zoneCode,
  });

  // int get getStars {
  //   log(this.categoryCode!.toString());
  //   try{
  //     return int.parse((categoryCode ?? "0").replaceAll(RegExp(r'[^0-9]'),''));
  //   }catch(err){
  //     return 0;
  //   }
  // }


  double get getStars {
    // Regular expression to capture a number potentially followed by '_<decimal>'
    var match = RegExp(r'(\d+)(?:_(\d+))?').firstMatch(categoryCode!);

    if (match != null) {
      var wholePart = int.tryParse(match.group(1)!) ?? 0;
      var decimalPart = int.tryParse(match.group(2) ?? '0') ?? 0;

      // التعامل مع نصف النجمة (مثل H3_5 يعني 3.5 نجمة)
      if (decimalPart >= 5) {
        return wholePart + 0.5;  // نعطيه تصنيف بنصف نجمة إذا كان يحتوي على نصف
      }

      return wholePart.toDouble();  // تحويل wholePart إلى double
    }

    // Assume luxury levels for codes with specific keywords
    if (categoryCode!.contains('LUX')) {
      return 5.0;
    }

    // Default based on other key identifiers
    if (categoryCode!.contains('VTV') || categoryCode!.contains('STD') || categoryCode!.startsWith('H')) {
      return 3.0;  // Return as double
    }

    // Default to a middle rating if no other rules match
    return 0.0;
  }

  int get getStarsInt {
    // Regular expression to capture a number potentially surrounded by other text
    var match = RegExp(r'(\d+)').firstMatch(categoryCode!);
    if (match != null) {
      return int.tryParse(match.group(1)!) ?? 0;  // Default to 3 if parsing fails
    }

    // Assume luxury levels for codes with specific keywords
    if (categoryCode!.contains('LUX')) {
      return 5;
    }

    // Default based on other key identifiers
    if (categoryCode!.contains('VTV') || categoryCode!.contains('STD') || categoryCode!.startsWith('H')) {
      return 3;  // More flexible handling of common codes
    }

    // Default to a middle rating if no other rules match
    return 0;
  }



  HotelContent copyWith({
    String? S2C,
    AccommodationType? accommodationType,
    String? accommodationTypeCode,
    ContentAndLanguage? address,
    List<String>? boardCodes,
    List<Board>? boards,
    Category? category,
    String? categoryCode,
    CategoryGroup? categoryGroup,
    String? categoryGroupCode,
    Chain? chain,
    String? chainCode,
    ContentAndLanguage? city,
    int? code,
    Coordinates? coordinates,
    Country? country,
    String? countryCode,
    ContentAndLanguage? description,
    Destination? destination,
    String? destinationCode,
    String? email,
    int? exclusiveDeal,
    List<Facility>? facilities,
    int? giataCode,
    List<ImageHotel>? images,
    List<InterestPoint>? interestPoints,
    List<Issue>? issues,
    String? lastUpdate,
    String? license,
    ContentAndLanguage? name,
    List<Phone>? phones,
    String? postalCode,
    int? ranking,
    List<RoomContent>? rooms,
    List<int>? segmentCodes,
    List<Segment>? segments,
    StateContent? state,
    String? stateCode,
    List<Terminal>? terminals,
    String? web,
    List<Wildcard>? wildcards,
    ZoneD? zone,
    int? zoneCode,
  }) {
    return HotelContent(
      S2C: S2C ?? this.S2C,
      accommodationType: accommodationType ?? this.accommodationType,
      accommodationTypeCode: accommodationTypeCode ?? this.accommodationTypeCode,
      address: address ?? this.address,
      boardCodes: boardCodes ?? this.boardCodes,
      boards: boards ?? this.boards,
      category: category ?? this.category,
      categoryCode: categoryCode ?? this.categoryCode,
      categoryGroup: categoryGroup ?? this.categoryGroup,
      categoryGroupCode: categoryGroupCode ?? this.categoryGroupCode,
      chain: chain ?? this.chain,
      chainCode: chainCode ?? this.chainCode,
      city: city ?? this.city,
      code: code ?? this.code,
      coordinates: coordinates ?? this.coordinates,
      country: country ?? this.country,
      countryCode: countryCode ?? this.countryCode,
      description: description ?? this.description,
      destination: destination ?? this.destination,
      destinationCode: destinationCode ?? this.destinationCode,
      email: email ?? this.email,
      exclusiveDeal: exclusiveDeal ?? this.exclusiveDeal,
      facilities: facilities ?? this.facilities,
      giataCode: giataCode ?? this.giataCode,
      images: images ?? this.images,
      interestPoints: interestPoints ?? this.interestPoints,
      issues: issues ?? this.issues,
      lastUpdate: lastUpdate ?? this.lastUpdate,
      license: license ?? this.license,
      name: name ?? this.name,
      phones: phones ?? this.phones,
      postalCode: postalCode ?? this.postalCode,
      ranking: ranking ?? this.ranking,
      rooms: rooms ?? this.rooms,
      segmentCodes: segmentCodes ?? this.segmentCodes,
      segments: segments ?? this.segments,
      state: state ?? this.state,
      stateCode: stateCode ?? this.stateCode,
      terminals: terminals ?? this.terminals,
      web: web ?? this.web,
      wildcards: wildcards ?? this.wildcards,
      zone: zone ?? this.zone,
      zoneCode: zoneCode ?? this.zoneCode,
    );
  }


  factory HotelContent.fromJson(dynamic json) {

    List<ImageHotel> getImagesSorted() {
      var image1 = ((json['images'] ?? []) as List)
          .map((e) => ImageHotel.fromJson(e))
          .toList();

      // فرز الصور بناءً على النوع "gen" أولاً، ثم بناءً على order
      image1.sort((a, b) {
        // إذا كان كلاهما من نوع "gen"، نرتب حسب order
        if (a.imageTypeCode == 'GEN' && b.imageTypeCode == 'GEN') {
          return a.order!.compareTo(b.order!);
        }

        // إذا كان أحدهما من نوع "gen" فقط، نعطيه الأولوية
        if (a.imageTypeCode == 'GEN' && b.imageTypeCode != 'GEN') {
          return -1; // a يأتي قبل b
        } else if (a.imageTypeCode != 'GEN' && b.imageTypeCode == 'GEN') {
          return 1; // b يأتي قبل a
        }

        // إذا لم يكن أي منهما من نوع "gen"، نرتب حسب order فقط
        return a.order!.compareTo(b.order!);
      });

      return image1;
    }

    return HotelContent(
      S2C: json['S2C'],
      accommodationType: json['accommodationType'] != null ? AccommodationType.fromJson(json['accommodationType'] ) : null,
      accommodationTypeCode: json['accommodationTypeCode'],
      address: json['address'] != null ? ContentAndLanguage.fromJson(json['address']) : null,
      boardCodes: json['boardCodes'] != null ? List<String>.from(json['boardCodes']) : null,
      boards: ((json['boards'] ?? []) as List).map((e) => Board.fromJson(e)).toList(),
      category: json['category'] != null ? Category.fromJson(json['category'] ) : null,
      categoryCode: json['categoryCode'],
      categoryGroup: json['categoryGroup'] != null ? CategoryGroup.fromJson(json['categoryGroup'] ) : null,
      categoryGroupCode: json['categoryGroupCode'],
      chain: json['chain'] != null ? Chain.fromJson(json['chain'] ) : null,
      chainCode: json['chainCode'],
      city: json['city'] != null ? ContentAndLanguage.fromJson(json['city']) : null,
      code: json['code'],
      coordinates: json["coordinates"] != null ? Coordinates.fromJson(json['coordinates']) : null,
      country: json['country'] != null ? Country.fromJson(json['country']) : null,
      countryCode: json['countryCode'],
      description: json['description'] != null ? ContentAndLanguage.fromJson(json['description']) : null,
      destination: json['destination'] != null ? Destination.fromJson(json['destination'] ) : null,
      destinationCode: json['destinationCode'],
      email: json['email'],
      exclusiveDeal: json['exclusiveDeal'],
      facilities: ((json['facilities'] ?? []) as List).map((e) => Facility.fromJson(e)).toList(),
      giataCode: json['giataCode'],
      images: getImagesSorted(), // فرز القائمة بناءً على قيمة order
      interestPoints: ((json['interestPoints']  ?? []) as List).map((e) => InterestPoint.fromJson(e)).toList(),
      issues: json['issues'] != null ? ((json['issues'] ?? []) as List).map((e) => Issue.fromJson(e)).toList() : null,
      lastUpdate: json['lastUpdate'],
      license: json['license'],
      name: json['name'] != null ? ContentAndLanguage.fromJson(json['name']) : null,
      phones: ((json['phones'] ?? []) as List).map((e) => Phone.fromJson(e)).toList(),
      postalCode: json['postalCode'],
      ranking: json['ranking'],
      rooms: ((json['rooms'] ?? []) as List).map((e) => RoomContent.fromJson(e)).toList(),
      segmentCodes: ((json['segmentCodes'] ?? []) as List).map((e) => e as int).toList(),
      segments: ((json['segments'] ?? []) as List).map((e) => Segment.fromJson(e)).toList(),
      state: json['state'] != null ? StateContent.fromJson((json['state'] ?? {})) : null,
      stateCode: json['stateCode'],
      terminals: ((json['terminals'] ?? []) as List).map((e) => Terminal.fromJson(e)).toList(),
      web: json['web'],
      wildcards: ((json['wildcards'] ?? []) as List).map((e) => Wildcard.fromJson(e)).toList(),
      zone: json['zone'] != null ? ZoneD.fromJson(json['zone'] ) : null,
      zoneCode: json['zoneCode'],
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'S2C': S2C,
      'accommodationType': accommodationType?.toJson(),
      'accommodationTypeCode': accommodationTypeCode,
      'address': address?.toJson(),
      'boardCodes': boardCodes,
      'boards': boards?.map((e) => e.toJson()).toList(),
      'category': category?.toJson(),
      'categoryCode': categoryCode,
      'categoryGroup': categoryGroup?.toJson(),
      'categoryGroupCode': categoryGroupCode,
      'chain': chain?.toJson(),
      'chainCode': chainCode,
      'city': city?.toJson(),
      'code': code,
      'coordinates': coordinates?.toJson(),
      'country': country?.toJson(),
      'countryCode': countryCode,
      'description': description?.toJson(),
      'destination': destination?.toJson(),
      'destinationCode': destinationCode,
      'email': email,
      'exclusiveDeal': exclusiveDeal,
      'facilities': facilities?.map((e) => e.toJson()).toList(),
      'giataCode': giataCode,
      'images': images.map((e) => e.toJson()).toList(),
      'interestPoints': interestPoints?.map((e) => e.toJson()).toList(),
      'issues': (issues ?? []).map((e) => e.toJson()).toList(),
      'lastUpdate': lastUpdate,
      'license': license,
      'name': name?.toJson(),
      'phones': phones?.map((e) => e.toJson()).toList(),
      'postalCode': postalCode,
      'ranking': ranking,
      'rooms': rooms?.map((e) => e.toJson()).toList(),
      'segmentCodes': segmentCodes,
      'segments': segments?.map((e) => e.toJson()).toList(),
      'state': state?.toJson(),
      'stateCode': stateCode,
      'terminals': terminals?.map((e) => e.toJson()).toList(),
      'web': web,
      'wildcards': wildcards?.map((e) => e.toJson()).toList(),
      'zone': zone?.toJson(),
      'zoneCode': zoneCode,
    };
  }


  String get getAddress {
    return address?.content ?? "";
  }

  String get getDescription {
    return description?.content ?? "";
  }

  // internet

  bool contain(int facilityCode,int facilityGroupCode){
    return facilities!.any((facility) => facility.facilityCode == facilityCode && facility.facilityGroupCode == facilityGroupCode);
  }



  @override
  bool operator ==(dynamic other) => identical(this, other) ||
      other is HotelContent &&
          runtimeType == other.runtimeType &&
          code == other.code;


  @override
  // TODO: implement hashCode
  int get hashCode => code.hashCode;

}





