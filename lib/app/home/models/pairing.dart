import 'package:kanpai/generated/l10n.dart';

class Pairing {
  final Map<String, String> pairingName = {
    "Meat": S.current.meat,
    "Fish": S.current.fish,
    "Sushi": S.current.sushi,
    "": "",
  };
  final Map<String, String> pairingImage = {
    "Meat": "images/viande.png",
    "Fish": "images/poisson.png",
    "Sushi": "images/sushi.png",
    "": "icons/Iconvide.png",
  };

  String getPairingName(String pairing) {
    return pairingName[pairing];
  }

  String getPairingImage(String pairing) {
    return pairingImage[pairing];
  }
}
