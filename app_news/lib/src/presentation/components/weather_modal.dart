import 'package:app_news/global/controller_states.dart';
import 'package:app_news/src/domain/entities/weather_entitie.dart';
import 'package:app_news/src/presentation/controllers/weather_city_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WeatherModal extends StatefulWidget {
  const WeatherModal({super.key});
  @override
  State<WeatherModal> createState() => _WeatherModalState();
}

class _WeatherModalState extends State<WeatherModal> {
  bool open = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        open == true ? Text('jajaj') : Text('jojo'),
        Consumer<WeatherCityController>(
          builder: (context, wControlller, child) {
            if (wControlller.state == ControllerStates.initial ||
                wControlller.state == ControllerStates.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (wControlller.state == ControllerStates.error) {
              return Column(
                children: [
                  Text(wControlller.error!.internalErrorCode),
                  Text(wControlller.error!.messageUser),
                ],
              );
            }

            WeatherEntitie weather = wControlller.weatherEntitie;
            return SizedBox(
              width: 200,
              child: Text('${weather.location.name}'),
            );
          },
        ),
        FloatingActionButton(
          onPressed: () {
            setState(() {
              open = !open;
            });
          },
          child: const Icon(Icons.navigation),
        ),
      ],
    );
  }
}
