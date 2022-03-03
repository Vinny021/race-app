import 'package:race_app/app/dtos/alert_dialog_props_dto.dart';
import 'package:race_app/app/dtos/race_dto.dart';
import 'package:race_app/app/dtos/racer_dto.dart';
import 'package:race_app/app/streams/alert_dialog_stram_controller.dart';

class RaceController {
  static DateTime startedDateTime;
  static int laps;
  static Race race;

  RaceController({startedDateTime, laps}) {
    race = Race(startedTime: startedDateTime, laps: laps);
  }

  addRaceLog(Racer racer) {

    DateTime timeCrossedLine = DateTime.now();
    int actualLap = 1;

    if (race.positions.contains(racer)) {
      AlertDialogStreamController.alertDialogController.add(AlertDialogProps(
          error: "Racer Already Finished",
          message: "Please select another number"));
      return;
    }

    race.raceLogs.forEach((key, value) {
      if (value == racer) {
        actualLap++;
      }
    });

    if (actualLap == race.laps) {
      race.positions.add(racer);
    }

    race.raceLogs.addAll({
      {actualLap: timeCrossedLine} : racer
    });
    
  }
}
