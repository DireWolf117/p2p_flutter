enum DeviceState {
  known,
  unknown,
  connected;

  String toJson() => name;
  static DeviceState fromJson(String json) => values.byName(json);
}

class P2pDevice {
  final String deviceId;
  DeviceState deviceState;

  P2pDevice({required this.deviceId, required this.deviceState});

  factory P2pDevice.fromJson(Map<String, dynamic> json) {
    return P2pDevice(
      deviceId: json['deviceId'],
      deviceState: DeviceState.fromJson(json['deviceState']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'deviceId': deviceId, 'deviceState': deviceState.toJson()};
  }
}
