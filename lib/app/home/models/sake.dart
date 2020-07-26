class Sake {
  Sake(
      {this.name,
      this.house,
      this.description,
      this.polished,
      this.rice,
      this.region,
      this.country,
      this.alcohol,
      this.rating,
      this.nbRatings,
      this.temperature,
      this.volume,
      this.pairings,
      this.characteristics});

  final String name;
  final String house;
  final String description;
  final String polished;
  final String rice;
  final String region;
  final String country;
  final double alcohol;
  final double rating;
  final int nbRatings;
  final int
      temperature; // 1:frais / 2:ambiant / 3:chaud / 4:frais ambiant / 5:frais chaud / 6:ambiant chaud / 7:frais ambiant chaud
  final List<double> volume;
  final List<String> pairings;
  final List<String> characteristics;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'house': house,
      'description': description,
      'polished': polished,
      'rice': rice,
      'region': region,
      'country': country,
      'alcohol': alcohol,
      'rating': rating,
      'nbRatings': nbRatings,
      'temperature': temperature,
      'volume': volume,
      'pairings': pairings,
      'characteristics': characteristics,
    };
  }
}