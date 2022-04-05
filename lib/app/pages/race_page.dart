import 'dart:async';

import 'package:flutter/material.dart';
import 'package:race_app/app/components/race_log_list.dart';
import 'package:race_app/app/components/racers_register.dart';
import 'package:race_app/app/controllers/race_controller.dart';
import 'package:race_app/app/controllers/storage_controller.dart';
import 'package:race_app/app/dtos/race_dto.dart';
import 'package:race_app/app/streams/refresh_page_stream.dart';

class RacePage extends StatefulWidget {
  // Race race;
  // RacePage(this.race);

  @override
  _RacePageState createState() => _RacePageState();
}

class _RacePageState extends State<RacePage> {
  StorageController storageController = StorageController();
  StreamSubscription refreshPageSubscription;

  @override
  void initState() {
    super.initState();

    refreshPageSubscription =
        RefreshPageStreamController.refreshPageStream.listen((_) {
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final Map race = ModalRoute.of(context).settings.arguments;

    if (race != null) {
      RaceController.race.startedTime = race['race'].startedTime;
      RaceController.race.laps = race['race'].laps;
    }

    storageController.saveRace(race['race']);

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
                'Race Started at ${RaceController.race.startedTime.hour}:${RaceController.race.startedTime.minute}'),
            SizedBox(
              height: 30,
            ),
            RacersRegister(),
            Divider(),
            RacerLogList()
          ],
        ),
      ),
    );
  }
}
