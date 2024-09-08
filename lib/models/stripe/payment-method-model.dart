

class PaymentMethodDataModel {

  final String? id;
  final String? object;
  final _BillingDetails? billingDetails;
  final CardDetailsModel? card;
  final int? created;
  final String? customer;
  final bool? livemode;
  final Map<dynamic, dynamic>? metadata;
  final String? type;

  PaymentMethodDataModel({
     this.id,
     this.object,
     this.billingDetails,
     this.card,
     this.created,
     this.customer,
     this.livemode,
     this.metadata,
     this.type,
  });

  // Factory method to create an instance from a JSON object
  factory PaymentMethodDataModel.fromJson(dynamic json) {
    return PaymentMethodDataModel(
      id: json['id'],
      object: json['object'],
      billingDetails: json['billing_details'] != null ? _BillingDetails.fromJson(json['billing_details']) : null,
      card: json['card'] != null ? CardDetailsModel.fromJson(json['card']) : null,
      created: json['created'],
      customer: json['customer'],
      livemode: json['livemode'],
      metadata: json['metadata'],
      type: json['type'],
    );
  }

  // Method to convert the instance to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'object': object,
      'billing_details': billingDetails?.toJson(),
      'card': card?.toJson(),
      'created': created,
      'customer': customer,
      'livemode': livemode,
      'metadata': metadata,
      'type': type,
    };
  }

  // CopyWith method to create a copy of the instance with new values
  PaymentMethodDataModel copyWith({
    String? id,
    String? object,
    _BillingDetails? billingDetails,
    CardDetailsModel? card,
    int? created,
    String? customer,
    bool? livemode,
    Map<String, dynamic>? metadata,
    String? type,
  }) {
    return PaymentMethodDataModel(
      id: id ?? this.id,
      object: object ?? this.object,
      billingDetails: billingDetails ?? this.billingDetails,
      card: card ?? this.card,
      created: created ?? this.created,
      customer: customer ?? this.customer,
      livemode: livemode ?? this.livemode,
      metadata: metadata ?? this.metadata,
      type: type ?? this.type,
    );
  }

  // Override equality operator ==
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PaymentMethodDataModel && other.id == id;
  }

  // Override hashCode based on id
  @override
  int get hashCode => id.hashCode;
}


class _Address {
  final String? city;
  final String? country;
  final String? line1;
  final String? line2;
  final String? postalCode;
  final String? state;

  _Address({
    required this.city,
    required this.country,
    required this.line1,
    required this.line2,
    required this.postalCode,
    required this.state,
  });

  // Factory method to create an instance from a JSON object
  factory _Address.fromJson(dynamic json) {
    return _Address(
      city: json['city'],
      country: json['country'],
      line1: json['line1'],
      line2: json['line2'],
      postalCode: json['postal_code'],
      state: json['state'],
    );
  }

  // Method to convert the instance to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'city': city,
      'country': country,
      'line1': line1,
      'line2': line2,
      'postal_code': postalCode,
      'state': state,
    };
  }

  // CopyWith method to create a copy of the instance with new values
  _Address copyWith({
    String? city,
    String? country,
    String? line1,
    String? line2,
    String? postalCode,
    String? state,
  }) {
    return _Address(
      city: city ?? this.city,
      country: country ?? this.country,
      line1: line1 ?? this.line1,
      line2: line2 ?? this.line2,
      postalCode: postalCode ?? this.postalCode,
      state: state ?? this.state,
    );
  }

  // Override equality operator ==
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is _Address &&
        other.city == city &&
        other.country == country &&
        other.line1 == line1 &&
        other.line2 == line2 &&
        other.postalCode == postalCode &&
        other.state == state;
  }

  // Override hashCode
  @override
  int get hashCode {
    return city.hashCode ^
    country.hashCode ^
    line1.hashCode ^
    line2.hashCode ^
    postalCode.hashCode ^
    state.hashCode;
  }
}



class _BillingDetails {
  final _Address? address;
  final String? email;
  final String? name;
  final String? phone;

  _BillingDetails({
    required this.address,
    required this.email,
    required this.name,
    required this.phone,
  });

  // Factory method to create an instance from a JSON object
  factory _BillingDetails.fromJson(dynamic json) {
    return _BillingDetails(
      address: json['address'] != null ? _Address.fromJson(json['address']) : null,
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
    );
  }

  // Method to convert the instance to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'address': address?.toJson(),
      'email': email,
      'name': name,
      'phone': phone,
    };
  }

  // CopyWith method to create a copy of the instance with new values
  _BillingDetails copyWith({
    _Address? address,
    String? email,
    String? name,
    String? phone,
  }) {
    return _BillingDetails(
      address: address ?? this.address,
      email: email ?? this.email,
      name: name ?? this.name,
      phone: phone ?? this.phone,
    );
  }

  // Override equality operator ==
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is _BillingDetails &&
        other.address == address &&
        other.email == email &&
        other.name == name &&
        other.phone == phone;
  }

  // Override hashCode
  @override
  int get hashCode {
    return address.hashCode ^
    email.hashCode ^
    name.hashCode ^
    phone.hashCode;
  }
}



class CardDetailsModel {
  final String? brand;
  final String? country;
  final int? expMonth;
  final int? expYear;
  final String? last4;
  final bool? threeDSecureSupported;

  CardDetailsModel({
    this.brand,
    this.country,
    required this.expMonth,
    required this.expYear,
    required this.last4,
    this.threeDSecureSupported,
  });

  // Factory method to create an instance from a JSON object
  factory CardDetailsModel.fromJson(dynamic json) {
    return CardDetailsModel(
      brand: json['brand'],
      country: json['country'],
      expMonth: json['exp_month'],
      expYear: json['exp_year'],
      last4: json['last4'],
      threeDSecureSupported: json['three_d_secure_usage'] != null ? json['three_d_secure_usage']['supported'] : null,
    );
  }

  // Method to convert the instance to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'brand': brand,
      'country': country,
      'exp_month': expMonth,
      'exp_year': expYear,
      'last4': last4,
      'three_d_secure_usage': {
        'supported': threeDSecureSupported,
      },
    };
  }

  // CopyWith method to create a copy of the instance with new values
  CardDetailsModel copyWith({
    String? brand,
    String? country,
    int? expMonth,
    int? expYear,
    String? last4,
    bool? threeDSecureSupported,
  }) {
    return CardDetailsModel(
      brand: brand ?? this.brand,
      country: country ?? this.country,
      expMonth: expMonth ?? this.expMonth,
      expYear: expYear ?? this.expYear,
      last4: last4 ?? this.last4,
      threeDSecureSupported: threeDSecureSupported ?? this.threeDSecureSupported,
    );
  }

  // Override equality operator ==
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CardDetailsModel &&
        other.brand == brand &&
        other.country == country &&
        other.expMonth == expMonth &&
        other.expYear == expYear &&
        other.last4 == last4 &&
        other.threeDSecureSupported == threeDSecureSupported;
  }

  // Override hashCode
  @override
  int get hashCode {
    return brand.hashCode ^
    country.hashCode ^
    expMonth.hashCode ^
    expYear.hashCode ^
    last4.hashCode ^
    threeDSecureSupported.hashCode;
  }
}

