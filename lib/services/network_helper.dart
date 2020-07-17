import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  Future getData(String url) async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print('Network fetch failed with code: ' + response.statusCode.toString());
    }
  }
}
