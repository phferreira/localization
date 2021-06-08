import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization_dart/app/modules/splash_screen/splashScreen_store.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  final String title;
  const SplashScreenPage({Key? key, this.title = 'SplashScreenPage'}) : super(key: key);
  @override
  SplashScreenPageState createState() => SplashScreenPageState();
}

class SplashScreenPageState extends ModularState<SplashScreenPage, SplashScreenStore> {
  @override
  initState() {
    super.initState();
    store.loadConfiguration();
    Modular.to.pushReplacementNamed("/home");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
