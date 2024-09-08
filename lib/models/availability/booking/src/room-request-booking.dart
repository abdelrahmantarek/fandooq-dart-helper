
part of '../booking.dart';

class RoomRequestPayment {
  final String rateKey;
  final List<Pax> paxes;

  RoomRequestPayment({
    required this.rateKey,
    required this.paxes,
  });

  RoomRequestPayment copyWith({
    String? rateKey,
    List<Pax>? paxes,
  }) {
    return RoomRequestPayment(
      rateKey: rateKey ?? this.rateKey,
      paxes: paxes ?? this.paxes,
    );
  }

  factory RoomRequestPayment.fromJson(dynamic json) => RoomRequestPayment(
    rateKey: json['rateKey'],
    paxes: List<Pax>.from(json['paxes'].map((x) => Pax.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    'rateKey': rateKey,
    'paxes': List<dynamic>.from(paxes.map((x) => x.toJson())),
  };
}

