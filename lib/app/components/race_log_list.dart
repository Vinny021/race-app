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
            height: MediaQuery.of(context).size.height * 0.12,
            width: MediaQuery.of(context).size.width,
            color: Colors.green.withOpacity(0.5),
            child: ListView(
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Positions'),
                    for (var i = 0;
                        i < RaceController.race.positions.length;
                        i++)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              '${i + 1}° Place ${RaceController.race.positions[i].name} - ${RaceController.race.positions[i].number}')
                        ],
                      )
                  ],
                ),
              ],
            ),
          ),
          Divider(),
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            child: ListView(
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: RaceController.race.raceLogs.map((log) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Column(
                              children: [
                                Text('${log.racer.number} - ${log.racer.name}'),
                                Text('Lap: ${log.voltaTempo.volta}'),
                                Text(
                                    'Time: ${log.voltaTempo.tempo.hour}:${log.voltaTempo.tempo.minute}:${log.voltaTempo.tempo.second}')
                              ],
                            ),
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
          ),
        ],
      ),
    );
  }
}
