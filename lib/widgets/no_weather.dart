import 'package:flutter/material.dart';

class NoWeatherView extends StatelessWidget {
  const NoWeatherView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
      
          children: [
          Text('There is no weather 😔,\n start searching now 🔍',style: TextStyle(fontSize: 30))
        ],),
      
    );
  }
}