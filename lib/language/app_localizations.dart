import 'package:flutter/material.dart';
import 'package:link_people/language/language_ar.dart';
import 'package:link_people/language/language_de.dart';
import 'package:link_people/language/language_en.dart';
import 'package:link_people/language/language_es.dart';
import 'package:link_people/language/language_fr.dart';
import 'package:link_people/language/language_hi.dart';
import 'package:link_people/language/language_pt.dart';
import 'package:link_people/language/languages.dart';
import 'package:nb_utils/nb_utils.dart';

class AppLocalizations extends LocalizationsDelegate<BaseLanguage> {
  const AppLocalizations();

  @override
  Future<BaseLanguage> load(Locale locale) async {
    switch (locale.languageCode) {
      case 'en':
        return LanguageEn();
      case 'ar':
        return LanguageAr();
      case 'hi':
        return LanguageHi();
      case 'fr':
        return LanguageFr();
      case 'es':
        return LanguageEs();
      case 'de':
        return LanguageDe();
      case 'pt':
        return LanguagePt();
      default:
        return LanguageEn();
    }
  }

  @override
  bool isSupported(Locale locale) =>
      LanguageDataModel.languages().contains(locale.languageCode);

  @override
  bool shouldReload(LocalizationsDelegate<BaseLanguage> old) => false;
}
