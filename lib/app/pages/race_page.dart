import 'package:flutter/material.dart';
import 'package:race_app/app/components/racers_register.dart';
import 'package:race_app/app/controllers/race_controller.dart';

class RacePage extends StatefulWidget {
  // Race race;
  // RacePage(this.race);

  @override
  _RacePageState createState() => _RacePageState();
}

class _RacePageState extends State<RacePage> {
  @override
  Widget build(BuildContext context) {
    final Map race = ModalRoute.of(context).settings.arguments;
    RaceController raceController = RaceController(
        startedDateTime: race['race'].startedTime, laps: race['race'].laps);

    return Scaffold(
      appBar: AppBar(
        title: Text('Race'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
                'Race Started at ${race['race'].startedTime.hour}:${race['race'].startedTime.minute}'),
            SizedBox(
              height: 30,
            ),
            RacersRegister(),
            Divider()
          ],
        ),
      ),
    );
  }
}
