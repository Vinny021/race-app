import 'package:race_app/app/components/race_log_list.dart';
import 'package:race_app/app/dtos/racer_dto.dart';

class Race {
  DateTime startedTime;
  List<Racer> racers;
  int laps;
  List<Racer> positions = [];
  Map<Map<int, DateTime>, Racer> raceLogs = {};

  Race(
      {this.startedTime,
      this.laps,
      this.racers,
      this.positions,
      this.raceLogs});

  Map<String, dynamic> toJson() {
    return {
      'startedTime': this.startedTime.toString(),
      'racers': this.racers.map((racer) {
        return racer.toJson();
      }).toList(),
      'laps': this.laps,
      'positions': this.positions.map((racer) {
        return racer.toJson();
      }).toList(),
      'raceLogs': this.raceLogs
    };
  }

  Race fromJson(Map<String, dynamic> json) {
    List<Map<String, dynamic>> racers = json['racers'];
    List<Map<String, dynamic>> positions = json['positions'];
    return Race(
        startedTime: DateTime.parse(json['startedTime']),
        racers: racers.map((racer) {
          return Racer().fromJson(racer);
        }).toList(),
        laps: json['laps'],
        positions: positions.map((racer) {
          return Racer().fromJson(racer);
        }).toList(),
        raceLogs: json['raceLogs']);
  }
}
