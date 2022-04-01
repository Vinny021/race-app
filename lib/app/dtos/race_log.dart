import 'package:race_app/app/dtos/race_dto.dart';
import 'package:race_app/app/dtos/racer_dto.dart';
import 'package:race_app/app/dtos/voltaTempo_dto.dart';

class RaceLog {
  VoltaTempo voltaTempo;
  Racer racer;

  RaceLog({this.voltaTempo, this.racer});

  Map<String, dynamic> toJson(){
    return {
      'voltaTempo': this.voltaTempo.toJson(),
      'racer': this.racer.toJson()
    };
  }

  RaceLog fromJson(Map<String, dynamic> json) {
    return RaceLog(
      voltaTempo: VoltaTempo().fromJson(json['voltaTempo']),
      racer: Racer().fromJson(json['racer'])
      );
  }
}