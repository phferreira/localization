import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension Localization on String {
  static Map<String, String> messages = Map();
  static Map<String, String> labels = Map();

  static Future configuration({
    String translationLocale = "assets/lang",
    String defaultLang = "pt_BR",
  }) async {
    String data;
    debugPrint("Loading localization data.");
    try {
      data = await rootBundle.loadString('$translationLocale/${Platform.localeName}.json');
    } catch (_) {
      data = await rootBundle.loadString('$translationLocale/$defaultLang.json');
    }
    Map<String, dynamic> _result = json.decode(data);

    _result["labels"].forEach((String key, dynamic value) {
      labels[key] = value.toString();
      debugPrint(value.toString());
    });
    _result["messages"].forEach((String key, dynamic value) {
      messages[key] = value.toString();
    });
    // labels.map((key, value) => debugPrint(""));
    debugPrint("Localization data loaded successfully!");
  }

  String i18n(Map<String, String> map, [List<String> args = const []]) {
    final key = this;

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

  String i18nMessages([List<String> args = const []]) {
    String _result = this.i18n(messages, args);
    return _result;
  }

  String i18nLabels([List<String> args = const []]) {
    String _result = this.i18n(labels, args);
    return _result;
  }

  // static void fromJson(Map<String, dynamic> json) => sentences = json;

  // Map<String, String> toJson() => sentences;
}
