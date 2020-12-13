class Collar {
  double lat;
  double long;

  Collar({
    this.lat,
    this.long,
  });

  factory Collar.fromJson(Map<String, dynamic> parsedJson) {
    return Collar(
      lat: parsedJson['lat'],
      long: parsedJson['lng'],
    );
  }
}
