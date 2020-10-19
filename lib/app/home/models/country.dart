import 'package:kanpai/generated/l10n.dart';

class Country {
  final Map<String, String> countryName = {
    "Japan": S.current.japan,
    "France": S.current.france,
    "": "",
  };
  final Map<String, String> countryFlag = {
    "Japan": "jp",
    "France": "fr",
    "": "",
  };

  String getCountryName(String country) {
    return countryName[country];
  }

  String getCountryFlag(String country) {
    return countryFlag[country];
  }
}
