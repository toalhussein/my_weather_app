import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                colorScheme: ColorScheme.light().copyWith(
                  primary: getColorTheme(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.weatherCondotion,
                  ),
                ),
                appBarTheme: AppBarTheme(
                  backgroundColor: getColorTheme(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.weatherCondotion,
                  ),
                ),
              ),
              debugShowCheckedModeBanner: false,
              home: const HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getColorTheme(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'Sunny':
      return Colors.amber;
    case 'Partly cloudy':
      return Colors.blueGrey;
    case 'Cloudy':
    case 'Mist':
    case 'Fog':
    case 'Freezing fog':
    case 'Overcast':
      return Colors.grey;

    case 'Patchy rain possible':
    case 'Patchy rain nearby':
    case 'Patchy snow possible':
    case 'Patchy sleet possible':
    case 'Patchy freezing drizzle possible':
    case 'Patchy light drizzle':
    case 'Patchy light rain':
    case 'Patchy light snow':
    case 'Patchy moderate snow':
    case 'Patchy heavy snow':
    case 'Patchy light rain with thunder':
    case 'Patchy light snow with thunder':
    case 'Light drizzle':
    case 'Light rain':
    case 'Light freezing rain':
    case 'Light sleet':
    case 'Light snow':
    case 'Light rain shower':
    case 'Light sleet showers':
    case 'Light snow showers':
    case 'Light showers of ice pellets':
      return Colors.blueGrey;

    case 'Moderate rain at times':
    case 'Moderate rain':
    case 'Moderate or heavy rain':
    case 'Moderate or heavy freezing rain':
    case 'Moderate or heavy sleet':
    case 'Moderate or heavy snow':
    case 'Moderate or heavy rain shower':
    case 'Moderate or heavy sleet showers':
    case 'Moderate or heavy snow showers':
    case 'Moderate or heavy showers of ice pellets':
    case 'Heavy rain at times':
    case 'Heavy rain':
    case 'Heavy freezing drizzle':
    case 'Heavy snow':
    case 'Heavy rain shower':
    case 'Torrential rain shower':
      return Colors.grey;
    case 'Thundery outbreaks possible':
    case 'Blowing snow':
    case 'Blizzard':
    case 'Ice pellets':
    case 'Moderate or heavy rain with thunder':
    case 'Moderate or heavy snow with thunder':
      return Colors.indigo;
    default:
      return Colors.blue;
  }
}
