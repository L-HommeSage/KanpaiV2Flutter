import 'package:kanpai/generated/l10n.dart';

class Flavor {
  final Map<String, String> flavorName = {
    "Fruity": S.current.fruity,
    "Acid": S.current.acid,
    "Soft": S.current.soft,
    "Floral": S.current.floral,
    "Fragrant": S.current.fragrant,
    "": "",
  };

  String getFlavorName(String pairing) {
    return flavorName[pairing];
  }
}
