import 'package:localization_dart/app/core/localizations/localization.dart';

class LocalizationLabels {
  static String homePage = "home-page".i18nMessages();
  static String pageId(String pageNumber) => "param-page".i18nMessages([pageNumber]);
}
