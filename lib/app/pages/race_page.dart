import 'package:flutter/material.dart';
import 'package:race_app/app/dtos/race_dto.dart';

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

    return Scaffold(
      appBar: AppBar(
        title: Text('Race'),
      ),
      body: Container(
        child: Text(race['race']),
      ),
    );
  }
}
