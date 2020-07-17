import 'package:super_app/models/city.dart';
import 'package:super_app/services/location_service.dart';
import 'package:super_app/services/network_helper.dart';
import 'package:super_app/util/constants.dart';

class WeatherService {
  Future<dynamic> getWeatherByCoords() async {
    try {
      Coord coord = await LocationService().getLocation();

      NetworkHelper networkHelper = NetworkHelper();
      return await networkHelper.getData(
        '${Constants.OWM_BASE_URL}/${Constants.OWM_WEATHER}?lat=${coord.lat}&lon=${coord.lon}&appid=${Constants.OWM_API_KEY}&units=metric',
      );
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<dynamic> getWeatherByCity(int cityId) async {
    NetworkHelper networkHelper = NetworkHelper();
    return await networkHelper.getData(
      '${Constants.OWM_BASE_URL}/${Constants.OWM_WEATHER}?id=$cityId&appid=${Constants.OWM_API_KEY}&units=metric',
    );
  }
}
