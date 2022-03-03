import 'package:race_app/app/dtos/racer_dto.dart';

class Race {
  DateTime startedTime;
  List<Racer> racers;
  int laps;
  List<Racer> positions = [];
  Map<Map<int, DateTime>, Racer> raceLogs = {};
  
  Race({this.startedTime, this.laps, this.racers});
}
