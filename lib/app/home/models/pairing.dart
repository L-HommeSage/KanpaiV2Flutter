import 'package:kanpai/generated/l10n.dart';

class Pairing {
  final Map<String, String> pairingName = {
    "Meat": S.current.meat,
    "Fish": S.current.fish,
    "Sushi": S.current.sushi,
    "Fried food": S.current.fried_food,
    "Pasta": S.current.pasta,
    "Vegetarian": S.current.vegetarian,
    "Dessert": S.current.dessert,
    "Cheese": S.current.cheese,
    "": "",
  };
  final Map<String, String> pairingImage = {
    "Meat": "images/viande.png",
    "Fish": "images/poisson.png",
    "Sushi": "images/sushi.png",
    "Fried food": "images/friture.png",
    "Pasta": "images/pasta.png",
    "Vegetarian": "images/vegetarian.png",
    "Dessert": "images/dessert.png",
    "Cheese": "images/cheese.png",
    "": "icons/Iconvide.png",
  };

  String getPairingName(String pairing) {
    return pairingName[pairing];
  }

  String getPairingImage(String pairing) {
    return pairingImage[pairing];
  }
}
