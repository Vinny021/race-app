import 'package:race_app/app/dtos/alert_dialog_props_dto.dart';
import 'package:race_app/app/dtos/race_dto.dart';
import 'package:race_app/app/dtos/racer_dto.dart';
import 'package:race_app/app/streams/alert_dialog_stram_controller.dart';

class RaceController {
  static Race race = Race();


  static addRaceLog(Racer racer) {
    print(racer.name);
    print(racer.number);

    DateTime timeCrossedLine = DateTime.now();
    int actualLap = 1;

    if (race.positions.contains(racer)) {
      print('Show Alert');
      AlertDialogStreamController.alertDialogController.add(AlertDialogProps(
          error: "Racer Already Finished",
          message: "Please select another number"));
      return;
    }

    print('Update');

    race.raceLogs.forEach((key, value) {
      if (value == racer) {
        print('Increment lap');
        actualLap++;
      }
    });

    if (actualLap == race.laps) {
      print('Finisehd');
      race.positions.add(racer);
    }

    race.raceLogs.addAll({
      {actualLap: timeCrossedLine} : racer
    });

    print(race.raceLogs);
  }
}
