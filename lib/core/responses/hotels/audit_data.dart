

class AuditData {


  final String? processTime;


  final String? timestamp;


  final String? requestHost;


  final String? serverId;


  final String? environment;


  final String? release;


  final String? token;


  final String? internal;

  AuditData({
    this.processTime,
    this.timestamp,
    this.requestHost,
    this.serverId,
    this.environment,
    this.release,
    this.token,
    this.internal,
  });

  AuditData.fromJson(dynamic json)
      : processTime = json['processTime'],
        timestamp = json['timestamp'],
        requestHost = json['requestHost'],
        serverId = json['serverId'],
        environment = json['environment'],
        release = json['release'],
        token = json['token'],
        internal = json['internal'];

  Map<String, dynamic> toJson() => {
    'processTime': processTime,
    'timestamp': timestamp,
    'requestHost': requestHost,
    'serverId': serverId,
    'environment': environment,
    'release': release,
    'token': token,
    'internal': internal,
  };

  AuditData copyWith({
    String? processTime,
    String? timestamp,
    String? requestHost,
    String? serverId,
    String? environment,
    String? release,
    String? token,
    String? internal,
  }) {
    return AuditData(
      processTime: processTime ?? this.processTime,
      timestamp: timestamp ?? this.timestamp,
      requestHost: requestHost ?? this.requestHost,
      serverId: serverId ?? this.serverId,
      environment: environment ?? this.environment,
      release: release ?? this.release,
      token: token ?? this.token,
      internal: internal ?? this.internal,
    );
  }

  @override
  int get hashCode => release.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AuditData && other.release == release;
  }
}