import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  final WeatherModel weatherModel;

  const WeatherInfoBody({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          getColorTheme(weatherModel.weatherCondotion),

          Colors.white
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            weatherModel.cityName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          Text(
            'Updated at ${weatherModel.date.hour}:${weatherModel.date.minute}',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.network(
                'https:${weatherModel.image!}',
                width: 100,
                height: 100,
              ),
              Text(
                weatherModel.temp.round().toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Column(
                children: [
                  Text(
                    'MinTemp: ${weatherModel.mintemp.round()}',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'MaxTemp: ${weatherModel.maxTemp.round()}',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
          Text(
            weatherModel.weatherCondotion,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ]),
      ),
    );
  }
}
