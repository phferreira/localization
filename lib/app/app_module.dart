import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization_dart/app/modules/splash_screen/splashScreen_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SplashScreenModule()),
  ];
}
