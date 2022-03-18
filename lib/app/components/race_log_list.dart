import 'package:flutter/material.dart';
import 'package:race_app/app/controllers/race_controller.dart';
import 'package:race_app/app/controllers/racers_controller.dart';
import 'package:race_app/app/streams/delete_racer_stream_controller.dart';

class RacerLogList extends StatefulWidget {
  @override
  _RacerLogListState createState() => _RacerLogListState();
}

class _RacerLogListState extends State<RacerLogList> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            height: 100,
            color: Colors.green,
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {});
              },
              child: Text('Press')),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: RaceController.race.raceLogs.entries.map((log) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text('${log.value.number} - ${log.value.name}'),
                        Text('Lap: ${log.key.keys.first}'),
                        Text(
                            'Time: ${log.key.values.first.hour}:${log.key.values.first.minute}:${log.key.values.first.second}')
                      ],
                    )
                  ],
                );
              }).toList()
              // Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              //   Flexible(
              //     child: ListTile(
              //       contentPadding: EdgeInsets.only(left: 10, right: 10),
              //       title: Text(racer.name),
              //       subtitle: Text(racer.number.toString()),
              //       onTap: () {
              //         DeleteRacerStreamController.deleteRacerController
              //             .add(racer);
              //       },
              //     ),
              //   )
              // ])

              ),
        ],
      ),
    );
  }
}
