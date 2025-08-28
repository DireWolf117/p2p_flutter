import 'package:flutter_test/flutter_test.dart';
import 'package:p2p_flutter/p2p_flutter.dart';
import 'package:p2p_flutter/p2p_flutter_platform_interface.dart';
import 'package:p2p_flutter/p2p_flutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockP2pFlutterPlatform
    with MockPlatformInterfaceMixin
    implements P2pFlutterPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final P2pFlutterPlatform initialPlatform = P2pFlutterPlatform.instance;

  test('$MethodChannelP2pFlutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelP2pFlutter>());
  });

  test('getPlatformVersion', () async {
    P2pFlutter p2pFlutterPlugin = P2pFlutter();
    MockP2pFlutterPlatform fakePlatform = MockP2pFlutterPlatform();
    P2pFlutterPlatform.instance = fakePlatform;

    expect(await p2pFlutterPlugin.getPlatformVersion(), '42');
  });
}
