
import 'p2p_flutter_platform_interface.dart';

class P2pFlutter {
  Future<String?> getPlatformVersion() {
    return P2pFlutterPlatform.instance.getPlatformVersion();
  }
}
