import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    didLoad();
  }

  void didLoad() async {
    Location location = Location();
    Networking networking = Networking('');

    //Get User Location and wait for result
    await location.getLocation();

    //Make API Call
    networking.getWeatherApiData(location.latitude, location.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
