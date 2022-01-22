import 'package:race_app/app/dtos/racer_dto.dart';

class Race {
  DateTime startedTime;
  List<Racer> racers;
  int laps;
  List<Racer> positions = [];

  Race({this.startedTime, this.laps, this.racers});
}
