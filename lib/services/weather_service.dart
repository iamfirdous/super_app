import 'package:super_app/models/city.dart';
import 'package:super_app/services/location_service.dart';
import 'package:super_app/services/network_helper.dart';
import 'package:super_app/util/api_keys.dart';
import 'package:super_app/util/constants.dart';

class WeatherService {
  Future<dynamic> getWeatherByCoords() async {
    try {
      Coord coord = await LocationService().getLocation();

      NetworkHelper networkHelper = NetworkHelper();
      return await networkHelper.getData(
        '${Constants.OWM_BASE_URL}/${Constants.OWM_WEATHER}?lat=${coord.lat}&lon=${coord.lon}&appid=${APIKeys.OWM_API_KEY}&units=metric',
      );
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<dynamic> getWeatherByCity(int cityId) async {
    NetworkHelper networkHelper = NetworkHelper();
    return await networkHelper.getData(
      '${Constants.OWM_BASE_URL}/${Constants.OWM_WEATHER}?id=$cityId&appid=${APIKeys.OWM_API_KEY}&units=metric',
    );
  }
}
