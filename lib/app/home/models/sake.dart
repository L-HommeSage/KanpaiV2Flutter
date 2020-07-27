class Sake {
  Sake(
      {this.name,
      this.family,
      this.house,
      this.description,
      this.polished,
      this.rice,
      this.region,
      this.country,
      this.photoUrl,
      this.alcohol,
      this.rating,
      this.nbRatings,
      this.temperature,
      this.volume,
      this.pairings,
      this.characteristics});

  final String name;
  final String family;
  final String house;
  final String description;
  final String polished;
  final String rice;
  final String region;
  final String country;
  final String photoUrl;
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
      'family': family,
      'house': house,
      'description': description,
      'polished': polished,
      'rice': rice,
      'region': region,
      'country': country,
      'photoUrl': photoUrl,
      'alcohol': alcohol,
      'rating': rating,
      'nbRatings': nbRatings,
      'temperature': temperature,
      'volume': volume,
      'pairings': pairings,
      'characteristics': characteristics,
    };
  }

  factory Sake.fromMap(Map<String, dynamic> data) {
    if (data == null) {
      return null;
    }
    final String name = data['name'];
    final String family = data['family'];
    final String house = data['house'];
    final String description = data['description'];
    final String polished = data['polished'];
    final String rice = data['rice'];
    final String region = data['region'];
    final String country = data['country'];
    final String photoUrl = data['photoUrl'];
    final double alcohol = data['alcohol'];
    final double rating = data['rating'];
    final int nbRatings = data['nbRatings'];
    final int temperature = data['temperature'];
    final List<double> volume = data['volume'];
    final List<String> pairings = data['pairings'];
    final List<String> characteristics = data['characteristics'];
    return Sake(
      name: name,
      family: family,
      house: house,
      description: description,
      polished: polished,
      rice: rice,
      region: region,
      country: country,
      photoUrl: photoUrl,
      alcohol: alcohol,
      rating: rating,
      nbRatings: nbRatings,
      temperature: temperature,
      volume: volume,
      pairings: pairings,
      characteristics: characteristics,
    );
  }
}
