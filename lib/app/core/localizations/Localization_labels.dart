import 'package:localization_dart/app/core/localizations/localization.dart';

class LocalizationLabels {
  static String homePage = "home-page".i18nLabels();
  static String pageId(String pageNumber) => "param-page".i18nLabels([pageNumber]);
}
