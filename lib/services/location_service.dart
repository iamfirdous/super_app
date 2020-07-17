import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:super_app/models/city.dart';
import 'package:super_app/util/constants.dart';

class LocationService {
  Future<Coord> getLocation() async {
    try {
      Position position = await Geolocator().getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
      return Coord(lat: position.latitude, lon: position.longitude);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List<City>> getCities({@required BuildContext context, String searchText}) async {
    searchText = searchText.trim().toLowerCase();
    if (searchText == null || searchText == '') {
      return [];
    }
    String data = await DefaultAssetBundle.of(context)
        .loadString('${Constants.JSON_PATH}city.list.json');
    List<City> cities = parseJson(data.toString());

    Map<String, City> cityMap = {};

    for (var city in cities) {
      cityMap[city.name] = city;
    }
    cities = cityMap.values.toList();

    cities.sort((a, b) => a.name.compareTo(b.name));
    return cities
        .where((city) => city.name.toLowerCase().startsWith(searchText))
        .take(16)
        .toList();
  }

  List<City> parseJson(String response) {
    if (response == null) {
      return [];
    }
    final parsed = jsonDecode(response.toString()).cast<Map<String, dynamic>>();
    return parsed.map<City>((json) => City.fromJson(json)).toList();
  }
}
