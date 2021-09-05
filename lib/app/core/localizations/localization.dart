import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Localization {
  static Map<String, String> _messages = Map();
  static Map<String, String> _labels = Map();

  static const String _translationLocale = "assets/lang";
  static const String _defaultLang = "en_US";

  static Future configuration({
    String translationLocale = _translationLocale,
    String translationLang = _defaultLang,
  }) async {
    debugPrint("Loading localization data.");
    String data;

    try {
      debugPrint('$translationLocale/$translationLang.json');
      data = await rootBundle.loadString('$translationLocale/$translationLang.json');
    } catch (e) {
      debugPrint('$translationLocale/$_defaultLang.json');
      data = await rootBundle.loadString('$translationLocale/$_defaultLang.json');
    }

    Map<String, dynamic> _result = json.decode(data);

    _result["labels"].forEach((String key, dynamic value) {
      _labels[key] = value.toString();
    });
    _result["messages"].forEach((String key, dynamic value) {
      _messages[key] = value.toString();
    });
    debugPrint("Localization data loaded successfully!");
  }

  static String _i18n(String key, Map<String, String> map, [List<String> args = const []]) {
    if (map.isEmpty) {
      throw "[Localization System] sentences is empty";
    }
    String res = '';
    if (map.containsKey(key)) {
      res = map[key].toString();
    } else {
      res = key;
    }

    if (args.isNotEmpty) {
      args.forEach((arg) {
        res = res.replaceFirst(RegExp(r'%s'), arg.toString());
      });
    }
    final String _result = res;
    return _result;
  }

  static String i18nMessages(String key, [List<String> args = const []]) {
    String _result = _i18n(key, _messages, args);
    return _result;
  }

  static String i18nLabels(String key, [List<String> args = const []]) {
    String _result = _i18n(key, _labels, args);
    return _result;
  }
}
