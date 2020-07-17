import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:super_app/models/city.dart';
import 'package:super_app/services/location_service.dart';
import 'package:super_app/util/constants.dart';
import 'package:super_app/util/debouncer.dart';

const String ROUTE_LOCATION_SEARCH = '/location-search';

class LocationSearchPage extends StatefulWidget {
  final String backgroundImage;

  LocationSearchPage({this.backgroundImage});

  @override
  _LocationSearchPageState createState() => _LocationSearchPageState();
}

class _LocationSearchPageState extends State<LocationSearchPage> {
  LocationService _location;
  List<City> _cities = [];
  String searchText = '';
  final Debouncer _debouncer = Debouncer(milliseconds: 1000);
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _location = LocationService();
  }

  void fetchCities() async {
    _cities = await _location.getCities(context: context, searchText: searchText);
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                widget.backgroundImage ?? '${Constants.IMAGES_PATH}day-bg.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(height: 32.0),
              Container(
                margin: const EdgeInsets.all(24.0),
                child: TextField(
                  onChanged: (value) {
                    searchText = value;
                    setState(() => isLoading = true);
                    _debouncer.run(() => fetchCities());
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.black.withOpacity(0.6),
                    suffixIcon: Icon(FontAwesomeIcons.search),
                    labelText: 'Search for the city',
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                  ),
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.text,
                  autofocus: true,
                ),
              ),
              if (isLoading)
                Container(
                  margin: const EdgeInsets.only(bottom: 24.0),
                  child: SpinKitWave(color: Colors.black.withOpacity(0.6), size: 24.0),
                ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                    left: 24.0,
                    right: 24.0,
                    bottom: 24.0,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(width: 2.0, color: Colors.white),
                    borderRadius: BorderRadius.circular(6.0),
                    color: Colors.black.withOpacity(0.6),
                  ),
                  child: _cities.length == 0 && searchText != ''
                      ? Center(
                          child: Text(
                            'No cities found',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.all(12.0),
                          itemCount: _cities.length,
                          itemBuilder: (context, index) {
                            return Container(
                              child: ListTile(
                                leading: Icon(
                                  FontAwesomeIcons.mapMarked,
                                  color: Colors.white,
                                ),
                                title: Text(
                                  _cities[index].name,
                                  style: TextStyle(color: Colors.white),
                                ),
                                onTap: () => Navigator.pop(context, _cities[index].id),
                              ),
                            );
                          },
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
