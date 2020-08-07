import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';

class Location {
  double latitude;
  double longitude;
  String cityName;

  Future getLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      longitude = position.longitude;
      latitude = position.latitude;

      print('Lat: $latitude Lon: $longitude');

      List<Placemark> newPlace =
          await Geolocator().placemarkFromCoordinates(latitude, longitude);

      Placemark placeMark = newPlace[0];
      String name = placeMark.name;
      String subLocality = placeMark.subLocality;
      cityName = placeMark.locality;
      String administrativeArea = placeMark.administrativeArea;
      String postalCode = placeMark.postalCode;
      String country = placeMark.country;
      String address =
          '$name, $subLocality, $cityName, $administrativeArea $postalCode, $country';

      print(address);
    } catch (e) {
      longitude = 0.0;
      latitude = 0.0;
      print(e);
    }
  }
}
