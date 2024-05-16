import 'package:weather_app/models/weather_model.dart';

class WeatherState {}

class WeatherInitialState extends WeatherState{}

class WeatherLoded extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLoded(this.weatherModel);
}

class WeatherFailurState extends WeatherState {
  final String errMessage;

  WeatherFailurState(this.errMessage); 


}

