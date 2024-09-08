part of '../booking.dart';


class DeviceRequest{
  final String? ip;
  final String? userAgent;
  DeviceRequest({
    this.ip,
    this.userAgent
  });
  Map<String, dynamic> toJson() => {
    'ip': ip,
    'userAgent': userAgent,
  };
}
