import 'package:kanpai/generated/l10n.dart';

class Flavor {
  final Map<String, String> flavorName = {
    "Fruity": S.current.fruity,
    "Acid": S.current.acid,
    "Soft": S.current.soft,
    "Floral": S.current.floral,
    "Fragrant": S.current.fragrant,
    "Round": S.current.round,
    "Earthy": S.current.earthy,
    "Matured": S.current.matured,
    "": "",
  };

  String getFlavorName(String pairing) {
    return flavorName[pairing];
  }
}
