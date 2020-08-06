import 'package:http/http.dart' as http;
import 'package:clima/utilities/apiKey.dart';

class Networking {
  String url;

  Networking(this.url);

  Future<http.Response> getWeatherApiData(double lat, double lon) async {
    var apiUrl =
        'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=&appid=$openWeatherMapApiKey';

    print('apiUrl: $apiUrl');

    var response = await http.get(apiUrl);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    return response;
  }
}
