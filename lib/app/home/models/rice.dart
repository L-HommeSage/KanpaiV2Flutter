import 'package:kanpai/generated/l10n.dart';

class Rice {
  final Map<String, String> riceDescription = {
    "Omachi": S.current.omachi_description,
    "Ginpu brown": "",
    "Hoshi Akari": "",
    "Yamadanishiki": "",
    "Gohyakumangoku": "",
    "Kannomai": "",
    "Hattanso": "",
    "": "",
  };

  String getDescription(String rice) {
    return riceDescription[rice];
  }
}
