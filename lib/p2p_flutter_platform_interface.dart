import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'p2p_flutter_method_channel.dart';

abstract class P2pFlutterPlatform extends PlatformInterface {
  /// Constructs a P2pFlutterPlatform.
  P2pFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static P2pFlutterPlatform _instance = MethodChannelP2pFlutter();

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
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
