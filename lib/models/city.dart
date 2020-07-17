class City {
  int id;
  String name;
  String state;
  String country;
  Coord coord;

  City({
    this.id,
    this.name,
    this.state,
    this.country,
    this.coord,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'] as int,
      name: json['name'] as String,
      state: json['state'] as String,
      country: json['country'] as String,
      coord: Coord.fromJson(json['coord']),
    );
  }

  String toString() {
    return 'name: $name, id: $id';
  }
}

class Coord {
  dynamic lon;
  dynamic lat;

  Coord({this.lon, this.lat});

  factory Coord.fromJson(Map<String, dynamic> json) {
    return Coord(
      lon: json['lon'],
      lat: json['lat'],
    );
  }
}
