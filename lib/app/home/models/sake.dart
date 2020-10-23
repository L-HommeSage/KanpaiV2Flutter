class Sake {
  Sake(
      {this.id,
      this.name,
      this.family,
      this.house,
      this.polished,
      this.rice,
      this.region,
      this.country,
      this.photoUrl,
      this.description,
      this.alcohol,
      this.rating,
      this.nbRatings,
      this.temperature,
      this.volume,
      this.pairings,
      this.characteristics,
      this.tagSearch});

  final String id;
  final String name;
  final String family;
  final String house;
  final String rice;
  final String region;
  final String country;
  final String photoUrl;
  final String description;
  final double alcohol;
  final double rating;
  final double polished;
  final int nbRatings;
  final int
      temperature; // 1:frais / 2:ambiant / 3:chaud / 4:frais ambiant / 5:frais chaud / 6:ambiant chaud / 7:frais ambiant chaud
  final List<int> volume;
  final List<String> pairings;
  final List<String> characteristics;
  final List<String> tagSearch;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'family': family,
      'house': house,
      'rice': rice,
      'region': region,
      'country': country,
      'photoUrl': photoUrl,
      'alcohol': alcohol,
      'rating': rating,
      'polished': polished,
      'nbRatings': nbRatings,
      'temperature': temperature,
      'volume': volume,
      'pairings': pairings,
      'characteristics': characteristics,
      'tagSearch': tagSearch,
    };
  }

  factory Sake.getDescription(Map<String, dynamic> data, String documentId) {
    if (data == null) {
      return null;
    }
    final String description = data['description'];
    return Sake(description: description);
  }

  factory Sake.fromMap(Map<String, dynamic> data, String documentId) {
    if (data == null) {
      return null;
    }
    final String name = data['name'];
    final String family = data['family'];
    final String house = data['house'];
    final String rice = data['rice'];
    final String region = data['region'];
    final String country = data['country'];
    final String photoUrl = data['photoUrl'];
    final double alcohol = (data['alcohol'] == null)
        ? data['alcohol']
        : data['alcohol'].toDouble();
    final double rating =
        (data['rating'] == null) ? data['rating'] : data['rating'].toDouble();
    final double polished = (data['polished'] == null)
        ? data['polished']
        : data['polished'].toDouble();
    final int nbRatings = (data['nbRatings'] == null)
        ? data['nbRatings']
        : data['nbRatings'].toInt();
    final int temperature = (data['temperature'] == null)
        ? data['temperature']
        : data['temperature'].toInt();
    final List<int> volume = List.from(data['volume']);
    final List<String> pairings = List.from(data['pairings']);
    final List<String> characteristics = List.from(data['characteristics']);
    final List<String> tagSearch = List.from(data['tagSearch']);

    return Sake(
      id: documentId,
      name: name,
      family: family,
      house: house,
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
      tagSearch: tagSearch,
    );
  }
}
