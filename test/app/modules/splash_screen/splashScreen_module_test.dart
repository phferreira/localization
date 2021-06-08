import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localization_dart/app/modules/splash_screen/splashScreen_module.dart';

void main() {
  setUpAll(() {
    initModule(SplashScreenModule());
  });
}
