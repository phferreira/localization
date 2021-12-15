library localization;

export './localization.dart';

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

class Localization {
  static Map<String, String> _messages = Map();
  static Map<String, String> _labels = Map();

  static const String _translationLocale = "assets/lang";
  static const String _defaultLang = "en_US";

  static Future<String> decompressFile(String locale) async {
    final File file = File(locale);

    final Uint8List data = file.readAsBytesSync();

    final List<int> decompress = gzip.decode(data);

    final String decoded = utf8.decode(decompress);

    return decoded;
  }

  static Future configuration({
    String translationLocale = _translationLocale,
    String translationLang = _defaultLang,
  }) async {
    // debugPrint("Loading localization data.");
    String data;

    try {
      // debugPrint('$translationLocale/$translationLang.gzip');
      data = await decompressFile('$translationLocale/$translationLang.gzip');
    } catch (e) {
      // debugPrint('$translationLocale/$_defaultLang.gzip');
      data = await decompressFile('$translationLocale/$_defaultLang.gzip');
    }

    final Map<String, dynamic> _result = json.decode(data);

    _result["labels"].forEach((String key, dynamic value) {
      _labels[key] = value.toString();
    });
    _result["messages"].forEach((String key, dynamic value) {
      _messages[key] = value.toString();
    });
    // debugPrint("Localization data loaded successfully!");
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
    final String _result = _i18n(key, _messages, args);
    return _result;
  }

  static String i18nLabels(String key, [List<String> args = const []]) {
    final String _result = _i18n(key, _labels, args);
    return _result;
  }
}
