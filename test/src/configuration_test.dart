import 'package:flutter_test/flutter_test.dart';
import 'package:localization/src/configuration.dart';

void main() {
  const String _locale = 'test/assets/lang';
  const String _localeNotFound = 'test/assets/lang/notFound';
  const String _lang = 'nt_FD';

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  group('Labels - ', () {
    setUpAll(() async {
      await Localization.configuration(translationLocale: _locale);
    });

    test('must be return a string when call app-name', () async {
      final String appname = Localization.i18nLabels('app-name');
      expect(appname, 'Localization');
    });

    test('must be return a string when call dynamic-page', () async {
      final String appname = Localization.i18nLabels('dynamic-page', ['1.0']);
      expect(appname, 'Home - 1.0');
    });

    test('must be return a string when call app-name when not found a language file but found a default language file', () async {
      await Localization.configuration(translationLocale: _locale, translationLang: _lang);
      final String appname = Localization.i18nLabels('app-name');
      expect(appname, 'Localization');
    });

    test('must be return a string when call dynamic-page when not found a language file but found a default language file', () async {
      await Localization.configuration(translationLocale: _locale, translationLang: _lang);
      final String appname = Localization.i18nLabels('dynamic-page', ['1.0']);
      expect(appname, 'Home - 1.0');
    });

    test('must be return a string "label-not-found" when not found label-not-found', () async {
      final String appname = Localization.i18nLabels('label-not-found');
      expect(appname, 'label-not-found');
    });

    test('must be return a string "dynamic-label-not-found" when not found dynamic-label-not-found', () async {
      final String appname = Localization.i18nLabels('dynamic-label-not-found', ['1.0']);
      expect(appname, 'dynamic-label-not-found');
    });

    test('must be return a string "label-not-found" when not found a language file but find default language file', () async {
      await Localization.configuration(translationLocale: _locale, translationLang: _lang);
      final String appname = Localization.i18nLabels('label-not-found');
      expect(appname, 'label-not-found');
    });

    test('must be return a string "label-not-found" when not found a language file', () async {
      await Localization.configuration(translationLocale: _localeNotFound);
      final String appname = Localization.i18nLabels('label-not-found');
      expect(appname, 'label-not-found');
    });

    test('must be return a empty string when not found a language file and search for a empty string', () async {
      await Localization.configuration(translationLocale: _localeNotFound);
      final String appname = Localization.i18nLabels('');
      expect(appname, '');
    });

    test('must be return a empty string when not found a language file but find default language file', () async {
      await Localization.configuration(translationLocale: _locale, translationLang: _lang);
      final String appname = Localization.i18nLabels('');
      expect(appname, '');
    });
  });

  group('Messages - ', () {
    setUpAll(() async {
      await Localization.configuration();
    });

    test('must be return a string when call welcome', () async {
      final String appname = Localization.i18nMessages('welcome');
      expect(appname, 'Welcome!');
    });
    test('must be return a dynamic string when call dynamic-welcome', () async {
      final String appname = Localization.i18nMessages('dynamic-welcome', ['User']);
      expect(appname, 'Welcome - User');
    });

    test('must be return a string when call welcome when not found a language file but found a default language file', () async {
      await Localization.configuration(translationLocale: _locale, translationLang: _lang);
      final String appname = Localization.i18nMessages('welcome');
      expect(appname, 'Welcome!');
    });

    test('must be return a string when call dynamic-welcome when not found a language file but found a default language file', () async {
      await Localization.configuration(translationLocale: _locale, translationLang: _lang);
      final String appname = Localization.i18nMessages('dynamic-welcome', ['User']);
      expect(appname, 'Welcome - User');
    });

    test('must be return a string "message-not-found" when not found message-not-found', () async {
      final String appname = Localization.i18nMessages('message-not-found');
      expect(appname, 'message-not-found');
    });

    test('must be return a string "dynamic-message-not-found" when not found dynamic-message-not-found', () async {
      final String appname = Localization.i18nMessages('dynamic-message-not-found', ['1.0']);
      expect(appname, 'dynamic-message-not-found');
    });

    test('must be return a string "message-not-found" when not found a language file but find default language file', () async {
      await Localization.configuration(translationLocale: _locale, translationLang: _lang);
      final String appname = Localization.i18nMessages('message-not-found');
      expect(appname, 'message-not-found');
    });

    test('must be return a string "message-not-found" when not found a language file', () async {
      await Localization.configuration(translationLocale: _localeNotFound);
      final String appname = Localization.i18nMessages('message-not-found');
      expect(appname, 'message-not-found');
    });

    test('must be return a empty string when not found a language file and search for a empty string', () async {
      await Localization.configuration(translationLocale: _localeNotFound);
      final String appname = Localization.i18nMessages('');
      expect(appname, '');
    });

    test('must be return a empty string when not found a language file but find default language file', () async {
      await Localization.configuration(translationLocale: _locale, translationLang: _lang);
      final String appname = Localization.i18nMessages('');
      expect(appname, '');
    });
  });
}
