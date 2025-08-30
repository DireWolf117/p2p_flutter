import 'package:p2p_flutter/datastructs/p2p_device.dart';
import 'package:p2p_flutter/p2p_flutter_android.dart';
import 'package:p2p_flutter/p2p_flutter_ios.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'dart:io';

abstract class P2pFlutterPlatform extends PlatformInterface {
  /// Constructs a P2pFlutterPlatform.
  P2pFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static P2pFlutterPlatform _instance = _createInstance();

  static P2pFlutterPlatform _createInstance() {
    if (Platform.isIOS) {
      return P2pFlutterIOS();
    } else if (Platform.isAndroid) {
      return P2pFlutterAndroid();
    } else {
      throw UnsupportedError("This device is not supported");
    }
  }

  /// The default instance of [P2pFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelP2pFlutter].
  static P2pFlutterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [P2pFlutterPlatform] when
  /// they register themselves.
  static set instance(P2pFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    return _instance.getPlatformVersion();
  }

  Stream<bool> get systemState;
  Stream<P2pDevice> get deviceList;

  bool connect(String deviceId);
  bool disconnect(String deviceId);
}
