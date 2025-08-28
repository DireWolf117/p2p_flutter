import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'p2p_flutter_platform_interface.dart';

/// An implementation of [P2pFlutterPlatform] that uses method channels.
class MethodChannelP2pFlutter extends P2pFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('p2p_flutter');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
