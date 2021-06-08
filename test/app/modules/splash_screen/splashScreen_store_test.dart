import 'package:flutter_test/flutter_test.dart';
import 'package:localization_dart/app/modules/splash_screen/splashScreen_store.dart';
 
void main() {
  late SplashScreenStore store;

  setUpAll(() {
    store = SplashScreenStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}