import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:race_app/app/controllers/race_controller.dart';
import 'package:race_app/app/controllers/racers_controller.dart';
import 'package:race_app/app/dtos/race_dto.dart';
import 'package:race_app/app/streams/refresh_page_stream.dart';

class StartRaceButton extends StatefulWidget {
  @override
  _StartRaceButtonState createState() => _StartRaceButtonState();
}

class _StartRaceButtonState extends State<StartRaceButton> {
  final TextEditingController numberOfLaps = TextEditingController();
  StreamSubscription refreshPageSubscription;
  bool isButtonDisabled = true;
  bool isContinueButtonDisabled = true;

  @override
  void initState() {
    numberOfLaps.addListener(() {
      checkIfButtonCanBeEnabled();
    });
    isContinueButtonDisabled = (RaceController.race == null ||
        RaceController.race.startedTime == null);

    refreshPageSubscription =
        RefreshPageStreamController.refreshPageStream.listen((_) {
      setState(() {
        isContinueButtonDisabled = (RaceController.race == null ||
            RaceController.race.startedTime == null);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('N° of Laps'),
            SizedBox(
              width: 10,
            ),
            Flexible(
              child: Container(
                height: 38,
                width: 50,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  controller: numberOfLaps,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: isButtonDisabled
                    ? null
                    : () {
                        setupAndStartRace(numberOfLaps.text);
                      },
                child: Text('Start New Race'),
                style: ElevatedButton.styleFrom(
                    primary: isButtonDisabled
                        ? Colors.grey
                        : Theme.of(context).colorScheme.primary)),
            SizedBox(
              width: 10,
            ),
            ElevatedButton(
                onPressed: isContinueButtonDisabled
                    ? null
                    : () {
                        continueRace();
                      },
                child: Text('Continue Race'),
                style: ElevatedButton.styleFrom(
                    primary: isContinueButtonDisabled
                        ? Colors.grey
                        : Theme.of(context).colorScheme.primary))
          ],
        )
      ],
    );
  }

  void checkIfButtonCanBeEnabled() {
    print(numberOfLaps.text);
    (numberOfLaps.text == '')
        ? setState(() {
            isButtonDisabled = true;
          })
        : setState(() {
            isButtonDisabled = false;
          });
  }

  void setupAndStartRace(String laps) {
    Race race = Race(
        startedTime: DateTime.now(),
        laps: int.parse(laps),
        racers: RacersController.racers,
        positions: [],
        raceLogs: []);

    RaceController.race.racers = RacersController.racers;
    RaceController.race.positions = [];
    RaceController.race.raceLogs = [];

    isContinueButtonDisabled = false;

    Navigator.of(context).pushNamed('/race', arguments: {'race': race});
  }

  void continueRace() {
    Race race = RaceController.race;
    Navigator.of(context).pushNamed('/race', arguments: {'race': race});
  }
}
