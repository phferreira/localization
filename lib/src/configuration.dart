import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:archive/archive_io.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Localization {
  static final Map<String, String> _messages = {};
  static final Map<String, String> _labels = {};

  static const String _translationLocale = 'assets/lang';
  static const String _defaultLang = 'en_US';

  static Future<String> _decompressFile(String locale) async {
    try {
      final ByteData _file = await rootBundle.load(locale);

      final Uint8List _data = _file.buffer.asUint8List();

      final List<int> _decompress = GZipDecoder().decodeBytes(_data);

      final String _decoded = utf8.decode(_decompress);

      debugPrint(locale);

      return _decoded;
    } catch (e) {
      debugPrint(e.toString());
      return '';
    }
  }

  static Future configuration({
    String translationLocale = _translationLocale,
    String translationLang = _defaultLang,
  }) async {
    debugPrint('Loading localization data.');
    String _data = '';

    try {
      _data = await _decompressFile('$translationLocale/$translationLang.gzip');

      if (_data.isEmpty) {
        _data = await _decompressFile('$translationLocale/$_defaultLang.gzip');
      }
    } finally {
      if (_data.isEmpty) {
        debugPrint('Localization data not loaded successfully!');
      } else {
        final Map<String, dynamic> _result = json.decode(_data);

        _result['labels'].forEach((String _key, dynamic _value) {
          _labels[_key] = _value.toString();
        });
        _result['messages'].forEach((String _key, dynamic _value) {
          _messages[_key] = _value.toString();
        });
        debugPrint('Localization data loaded successfully!');
      }
    }
  }

  static String _i18n(String key, Map<String, String> map, [List<String> args = const []]) {
    if (map.isEmpty) {
      throw 'Localization sentences is empty';
    }
    String _result = '';
    if (map.containsKey(key)) {
      _result = map[key].toString();
    } else {
      _result = key;
    }

    if (args.isNotEmpty) {
      for (String arg in args) {
        _result = _result.replaceFirst(RegExp(r'%s'), arg.toString());
      }
    }
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
