class WeatherModel {
  final String cityName;
  final String? image;
  final DateTime date;
  final double temp;
  final double maxTemp;
  final double mintemp;
  final String weatherCondotion;

  WeatherModel(
      {required this.cityName,
      required this.date,
      required this.image,
      required this.temp,
      required this.maxTemp,
      required this.mintemp,
      required this.weatherCondotion});

  factory WeatherModel.json(json) {
    return WeatherModel(
        cityName: json['location']['name'],
        date: DateTime.parse(json['current']['last_updated']),
        temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        mintemp: json['forecast']['forecastday'][0]['day']['mintemp_f'],
        image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
        weatherCondotion: json['forecast']['forecastday'][0]['day']['condition']['text']);
  }
}
