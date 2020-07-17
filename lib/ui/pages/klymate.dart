import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:super_app/models/weather.dart';
import 'package:super_app/services/weather_service.dart';
import 'package:super_app/ui/widgets/location_card.dart';
import 'package:super_app/ui/widgets/temp_card.dart';
import 'package:super_app/ui/widgets/unit_switcher.dart';

import 'location_search.dart';

const String ROUTE_KLYMATE = '/klymate';

class KlymatePage extends StatefulWidget {
  @override
  _KlymatePageState createState() => _KlymatePageState();
}

class _KlymatePageState extends State<KlymatePage> {
  Weather weather;
  bool isLoading = false;
  bool isCelcius = true;

  @override
  void initState() {
    super.initState();
    fetchWeatherByCoords();
  }

  void fetchWeatherByCoords() async {
    setState(() => isLoading = true);
    try {
      weather = Weather.fromJson(json: await WeatherService().getWeatherByCoords());
    } catch (e) {
      weather = Weather.fromJson(code: e.code);
    }
    setState(() => isLoading = false);
  }

  void fetchWeatherByCity(int cityId) async {
    setState(() => isLoading = true);
    weather = Weather.fromJson(json: await WeatherService().getWeatherByCity(cityId));
    setState(() => isLoading = false);
  }

  void openLocationSearch() async {
    int cityId = await Navigator.of(context).pushNamed(
      ROUTE_LOCATION_SEARCH,
      arguments: {'backgroundImage': weather.background},
    ) as int;
    if (cityId != null) {
      fetchWeatherByCity(cityId);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark,
          child: SpinKitSquareCircle(
            color: Colors.black,
            size: 52.0,
          ),
        ),
      );
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(weather.background),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                child: TempCard(
                  weather: weather,
                  isCelcius: isCelcius,
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      LocationCard(
                        weather: weather,
                        onTap: openLocationSearch,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          UnitSwitcher(
                            isCelcius: isCelcius,
                            onChanged: (value) => setState(() => isCelcius = value),
                          ),
                          RawMaterialButton(
                            constraints: BoxConstraints.tightFor(
                              width: 74.0,
                              height: 74.0,
                            ),
                            shape: CircleBorder(
                              side: BorderSide(
                                width: 2.0,
                                color: Colors.white,
                              ),
                            ),
                            fillColor: Colors.black.withOpacity(0.6),
                            onPressed: fetchWeatherByCoords,
                            child: Icon(
                              Icons.gps_fixed,
                              color: Colors.white,
                              size: 36.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
