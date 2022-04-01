import 'package:race_app/app/controllers/storage_controller.dart';
import 'package:race_app/app/dtos/alert_dialog_props_dto.dart';
import 'package:race_app/app/dtos/race_dto.dart';
import 'package:race_app/app/dtos/race_log.dart';
import 'package:race_app/app/dtos/racer_dto.dart';
import 'package:race_app/app/dtos/voltaTempo_dto.dart';
import 'package:race_app/app/streams/alert_dialog_stram_controller.dart';
import 'package:race_app/app/streams/refresh_page_stream.dart';

class RaceController {
  static Race race = Race();

  static loadRace() async {
    StorageController storageController = StorageController();
    List<Race> raceLoaded = await storageController.loadRace();
    race = (raceLoaded.isNotEmpty) ? raceLoaded[0] : Race();
    RefreshPageStreamController.refreshPageController.add(null);
  }


  static addRaceLog(Racer racer) {
    StorageController storageController = StorageController();
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

    race.raceLogs.forEach((log) {
      if (log.racer == racer) {
        print('Increment lap');
        actualLap++;
      }
    });

    if (actualLap == race.laps) {
      print('Finisehd');
      race.positions.add(racer);
    }

    race.raceLogs.addAll({
      RaceLog(voltaTempo: VoltaTempo(tempo: timeCrossedLine, volta: actualLap), racer: racer)
    });
    
    storageController.saveRace(race);

    print(race.raceLogs);
  }
}
