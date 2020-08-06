import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;
  Future getLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    longitude = position.longitude;
    latitude = position.latitude;

    print('Lat: $latitude Lon: $longitude');
  }
}
