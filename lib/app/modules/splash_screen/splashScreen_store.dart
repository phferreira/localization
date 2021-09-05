import 'package:flutter_triple/flutter_triple.dart';
import 'package:localization_dart/app/core/localizations/localization.dart';

class SplashScreenStore extends NotifierStore<Exception, int> {
  SplashScreenStore() : super(0);

  loadConfiguration() async {
    await Localization.configuration();
  }
}
