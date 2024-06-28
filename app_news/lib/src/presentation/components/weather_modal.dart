import 'package:app_news/global/controller_states.dart';
import 'package:app_news/src/domain/entities/weather_entitie.dart';
import 'package:app_news/src/presentation/components/custom_circular_progress_indicator.dart';
import 'package:app_news/src/presentation/components/image_weather.dart';
import 'package:app_news/src/presentation/controllers/weather_city_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WeatherModal extends StatelessWidget {
  const WeatherModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<WeatherCityController>(
          builder: (context, wControlller, child) {
            if (wControlller.state == ControllerStates.initial ||
                wControlller.state == ControllerStates.loading) {
              return CustomCircularProgressIndicator();
            } else if (wControlller.state == ControllerStates.error) {
              return Column(
                children: [
                  Text(wControlller.error!.internalErrorCode),
                  Text(wControlller.error!.messageUser),
                ],
              );
            }
            WeatherEntitie weather = wControlller.weatherEntitie;
            return Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => weatherAlert(weather: weather),
                  );
                },
                child: ImageWeather(
                  urlImage: 'https:${weather.current.condition.icon}',
                  moreBig: false,
                ),
                tooltip: 'Clima',
                backgroundColor: const Color.fromARGB(248, 215, 225, 250),
                shape: CircleBorder(),
                splashColor: const Color.fromARGB(251, 122, 177, 244),
              ),
            );
          },
        )
      ],
    );
  }
}

LinearGradient DefineWeatherColor(double temp) {
  if (temp < 20) {
    return const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomRight,
      colors: <Color>[
        Color.fromARGB(252, 73, 11, 199),
        Color.fromARGB(255, 209, 212, 244),
      ],
    );
  } else if (temp < 30) {
    return const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomRight,
      colors: <Color>[
        Color.fromARGB(255, 13, 182, 63),
        Color.fromARGB(255, 208, 252, 205),
      ],
    );
  } else {
    return const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomRight,
      colors: <Color>[
        Color.fromARGB(245, 209, 89, 9),
        Color.fromARGB(255, 251, 246, 188),
      ],
    );
  }
}

class weatherAlert extends StatelessWidget {
  weatherAlert({
    super.key,
    required this.weather,
  });

  final WeatherEntitie weather;

  final Runes wind = Runes('\u{1F343}');
  final Runes drop = Runes('\u{1F4A7}');
  final Runes cloud = Runes('\u{2601}');

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      content: Container(
        decoration: BoxDecoration(
          gradient: DefineWeatherColor(weather.current.tempC),
          borderRadius: BorderRadius.circular(15),
        ),
        height: 320,
        child: Column(
          children: [
            Text(
              weather.location.name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 239, 235, 235),
              ),
            ),
            Text(
              weather.location.localtime,
              style: TextStyle(
                fontSize: 12,
                color: const Color.fromARGB(248, 220, 222, 225),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  child: ImageWeather(
                    urlImage: 'https:${weather.current.condition.icon}',
                    moreBig: true,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(weather.current.tempC.toString(),
                          style: TextStyle(
                            fontSize: 20,
                            color: const Color.fromARGB(255, 48, 48, 48),
                          )),
                      Text(
                        weather.current.condition.text,
                        style: TextStyle(
                          fontSize: 12,
                          color: const Color.fromARGB(252, 62, 62, 62),
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(String.fromCharCodes(wind),
                        style: TextStyle(
                          fontSize: 35,
                        )),
                    Text(
                      '${weather.current.windKph} kph',
                      style: TextStyle(
                        fontSize: 18,
                        color: const Color.fromARGB(255, 64, 65, 71),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    Text(String.fromCharCodes(cloud),
                        style: TextStyle(
                          fontSize: 35,
                        )),
                    Text(
                      '${weather.current.cloud}%',
                      style: TextStyle(
                        fontSize: 18,
                        color: const Color.fromARGB(255, 64, 65, 71),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    Text(String.fromCharCodes(drop),
                        style: TextStyle(
                          fontSize: 35,
                        )),
                    Text(
                      '${weather.current.humidity}%',
                      style: TextStyle(
                        fontSize: 18,
                        color: const Color.fromARGB(255, 64, 65, 71),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK',
                  style: TextStyle(
                    fontSize: 18,
                    color: const Color.fromARGB(255, 64, 65, 71),
                  )),
            ),
          ],
        ),
      ),
      contentPadding: EdgeInsets.all(1),
    );
  }
}
