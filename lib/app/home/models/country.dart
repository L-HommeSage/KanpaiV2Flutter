import 'package:kanpai/generated/l10n.dart';

class Country {
  final Map<String, String> countryName = {
    "Japan": S.current.japan,
    "France": S.current.france,
    "Norway": S.current.norway,
    "China": S.current.china,
    "South Korea": S.current.south_korea,
    "Canada": S.current.canada,
    "Brazil": S.current.brazil,
    "Australia": S.current.australia,
    "Vietnam": S.current.vietnam,
    "Thailand": S.current.thailand,
    "Singapore": S.current.singapore,
    "Germany": S.current.germany,
    "United Kingdom": S.current.united_kingdom,
    "Romania": S.current.romania,
    "Spain": S.current.spain,
    "Italy": S.current.italy,
    "United States": S.current.united_states,
    "": "",
  };
  final Map<String, String> countryFlag = {
    "Japan": "jp",
    "France": "fr",
    "Norway": "no",
    "China": "cn",
    "South Korea": "kr",
    "Canada": "ca",
    "Brazil": "br",
    "Australia": "au",
    "Vietnam": "vn",
    "Thailand": "th",
    "Singapore": "sg",
    "Germany": "de",
    "United Kingdom": "gb",
    "Romania": "ro",
    "Spain": "es",
    "Italy": "it",
    "United States": "us",
    "": "",
  };

  String getCountryName(String country) {
    return countryName[country];
  }

  String getCountryFlag(String country) {
    return countryFlag[country];
  }
}
