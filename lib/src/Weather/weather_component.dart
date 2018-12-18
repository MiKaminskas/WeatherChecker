import 'dart:async';

import 'package:AngWebTest/src/Model/Weather.dart';
import 'package:AngWebTest/src/Weather/weather_service.dart';
import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import 'weather_service.dart';

@Component(
  selector: 'weather-component',
  styleUrls: ['weather_component.css'],
  templateUrl: 'weather_component.html',
  directives: [
    MaterialCheckboxComponent,
    MaterialFabComponent,
    MaterialIconComponent,
    materialInputDirectives,
    NgFor,
    NgIf,
    ScorecardComponent,
    MaterialButtonComponent,
  ],
  providers: [materialProviders, ClassProvider(WeatherService)],
)
class WeatherComponent implements OnInit {
  final WeatherService weatherService;

  String checkNewCity = '';
  List<String> temperatures = [];
  List<String> dates = [];
  Weather weather;

  WeatherComponent(this.weatherService);

  @override
  Future<Null> ngOnInit() async {
  }

  void downloadJson() async {
      temperatures = [];
      dates = [];
      String url = 'http://192.168.1.242:8080/greeting?city=' + checkNewCity;
      String buf = await weatherService.getJson(url);
      weather = weatherService.parseWeather(buf);

      var now = DateTime.fromMillisecondsSinceEpoch(weather.days[0].dt * 1000);

      for (int i = 0; i < weather.days.length; i++) {

        var next = now.add(new Duration(days: i));
        temperatures.add(weather.days[i].temp.day.toString());
        dates.add(next.day.toString() +
            "-" +
            next.month.toString() +
            "-" +
            next.year.toString());
      }
  }
}
