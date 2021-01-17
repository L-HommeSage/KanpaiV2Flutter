import 'package:kanpai/generated/l10n.dart';

class Rice {
  final Map<String, String> riceDescription = {
    "Yamada Nishiki": S.current.yamada_nishiki_description,
    "Omachi": S.current.omachi_description,
    "Gohyakumangoku": S.current.gohyakumangoku_description,
    "Miyama Nishiki": S.current.miyama_nishiki_description,
    "Dewasansan": S.current.dewasansan_description,
    "Kame no O": S.current.kame_no_o_description,
    "Ginpu": S.current.ginpu_description,
    "Akita Sake Komachi": S.current.akita_sake_komachi_description,
    "Ginginga": S.current.ginginga_description,
    "Watari Bune": S.current.watari_bune_description,
    "Tamazakae": S.current.tamazakae_description,
    "Hattan Nishiki": S.current.hattan_nishiki_description,
    "Oseto": S.current.oseto_description,
    "Aiyama": S.current.aiyama_description,
    "Dewa no Sato": S.current.dewa_no_sato_description,
    "Ginfubuki": S.current.ginfubuki_description,
    "Ginnosato": S.current.ginnosato_description,
    "Ginnosei": S.current.ginnosei_description,
    "Ginotome": S.current.ginotome_description,
    "Goriki": S.current.goriki_description,
    "Hanafubuki": S.current.hanafubuki_description,
    "Hakutsuru Nishiki": S.current.hakutsuru_nishiki_description,
    "Hattan": S.current.hattan_description,
    "Hattanso": S.current.hattanso_description,
    "Hidahomare": S.current.hidahomare_description,
    "Hitogokochi": S.current.hitogokochi_description,
    "Hyogo Kita Nishiki": S.current.hyogo_kita_nishiki_description,
    "Hyogo Yume Nishiki": S.current.hyogo_yume_nishiki_description,
    "Hoshi Akari": S.current.hoshi_akari_description,
    "Iwai": S.current.iwai_description,
    "Kan no Mai": S.current.kan_no_mai_description,
    "Koshihikari": S.current.koshihikari_description,
    "Koshi Tanrei": S.current.koshi_tanrei_description,
    "Kura no Hana": S.current.kura_no_hana_description,
    "Saka Nishiki": S.current.saka_nishiki_description,
    "Senbon Nishiki": S.current.senbon_nishiki_description,
    "Shinriki": S.current.shinriki_description,
    "Yamadaho": S.current.yamadaho_description,
    "Yume no Kaori": S.current.yume_no_kaori_description,
    "": "",
  };

  String getDescription(String rice) {
    return riceDescription[rice];
  }
}
