import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'package:AngWebTest/src/Model/Weather.dart';
import 'package:angular/core.dart';

/// Mock service emulating access to a to-do list stored on a server.
@Injectable()
class WeatherService {

  Future<String> getJson(url) async => HttpRequest.getString((url));

  Weather parseWeather(jsonString) {
    var jsonObj = json.decode(jsonString);
    Weather out = Weather();

    out.id = jsonObj['id'];
    out.name = jsonObj['name'];
    out.lon = jsonObj['lon'];
    out.lat = jsonObj['lat'];
    out.country = jsonObj['country'];
    out.population = jsonObj['population'];

    var days = jsonObj['days'];
    List<Day> lst = new List();
    (days as List).map((i) => lst.add(parseJson(i))).toList();
    out.days = lst;

    return out;
  }

  Day parseJson(json) {
    var day = new Day();

    day.dt = json["dt"];
    day.pressure = json["pressure"];
    day.humidity = json["humidity"];
    day.speed = json["speed"];
    day.deg = json["deg"];
    day.clouds = json["clouds"];

    var jsonObjTemp = json["temp"];
    var temp = new Temp();
    temp.day = jsonObjTemp["day"];
    temp.min = jsonObjTemp["min"];
    temp.max = jsonObjTemp["max"];
    temp.night = jsonObjTemp["night"];
    temp.eve = jsonObjTemp["eve"];
    temp.morn = jsonObjTemp["morn"];

    day.temp = temp;
    return day;
  }

}
