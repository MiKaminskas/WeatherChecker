import 'package:angular/angular.dart';

import 'src/Weather/weather_component.dart';

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [WeatherComponent],
)
class AppComponent {

}
