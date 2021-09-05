import 'package:localization_dart/app/core/localizations/localization.dart';

class LocalizationMessages {
  static String homePage = Localization.i18nMessages("home-page");
  static String pageId(String pageNumber) => Localization.i18nMessages("param-page", [pageNumber]);
}
