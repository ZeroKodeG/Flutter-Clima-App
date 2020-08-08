import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking {
  Networking(this.url);
  final url;

  Future getWeatherApiData() async {
    print('Getting over HTTP: $url');
    var response = await http.get(url);

    print('Response status: ${response.statusCode}');
    //print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
