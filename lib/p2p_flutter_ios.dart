import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:p2p_flutter/datastructs/p2p_device.dart';

import 'p2p_flutter_platform_interface.dart';

/// An implementation of [P2pFlutterPlatform] that uses method channels.
class P2pFlutterIOS extends P2pFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final wifiAwareMethodChannel = const MethodChannel('p2p_flutter');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await wifiAwareMethodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
    return version;
  }

  @override
  Stream<bool> get systemState => throw UnimplementedError();

  @override
  bool connect(String deviceId) {
    // TODO: implement connect
    throw UnimplementedError();
  }

  @override
  // TODO: implement deviceList
  Stream<P2pDevice> get deviceList => throw UnimplementedError();

  @override
  bool disconnect(String deviceId) {
    // TODO: implement disconnect
    throw UnimplementedError();
  }
}
