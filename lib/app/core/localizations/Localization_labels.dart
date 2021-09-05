import 'package:localization_dart/app/core/localizations/localization.dart';

class LocalizationLabels {
  static String homePage = Localization.i18nLabels("home-page");
  static String pageId(String pageNumber) => Localization.i18nLabels("param-page", [pageNumber]);
}
