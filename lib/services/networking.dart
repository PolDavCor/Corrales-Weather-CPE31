// ignore_for_file: unnecessary_new

import 'package:http/http.dart';
import 'package:test_clima_flutter/services/location.dart';

class Networking{
  String keyID = "7261a0d3ca5229359aee897d81b9d48e";
  String data = '';
  Future<String> getLoc() async {
    Location location = new Location();
    await location.getLocation();
    Uri url = Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat=${location.lat}&lon=${location.lon}&appid=$keyID&units=metric");
    Response response = await get(url);
    data = response.body;
    if (response.statusCode == 200){
      return data;
    }else{
      return "Error";
    }
  }
  Future<String> getCity(String nc) async {
    Location location = new Location();
    await location.getLocation();

    Uri url = Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$nc&appid=$keyID&units=metric");
    Response response = await get(url);
    data = response.body;

    if (response.statusCode == 200){
      return data;
    }else{
      return "No City Indicated";
    }
  }
}