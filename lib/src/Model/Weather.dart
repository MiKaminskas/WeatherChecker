class Weather {
  int id;
  String name;
  String lon;
  String lat;
  String country;
  int population;
  List<Day> days;
  String temp;
}

class Day{
  int dt;
  Temp temp;
  double pressure;
  double humidity;
  Map<String,String> weather;
  double speed;
  double deg;
  double clouds;
}
class Temp{
  double day;
  double min;
  double max;
  double night;
  double eve;
  double morn;
}
