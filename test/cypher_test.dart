import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cypher/cypher.dart';

void main() {
  const MethodChannel channel = MethodChannel('cypher');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPassword', () async {
    expect(await Cypher.create(length: null), '42');
  });
}
