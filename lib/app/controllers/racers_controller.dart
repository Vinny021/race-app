import 'package:race_app/app/controllers/storage_controller.dart';
import 'package:race_app/app/dtos/alert_dialog_props_dto.dart';
import 'package:race_app/app/dtos/racer_dto.dart';
import 'package:race_app/app/streams/alert_dialog_stram_controller.dart';
import 'package:race_app/app/streams/refresh_page_stream.dart';

class RacersController {
  StorageController sharedPreferencesController = StorageController();
  static List<Racer> racers = [];

  loadRacers() async {
    racers = await sharedPreferencesController.loadRacers();
    RefreshPageStreamController.refreshPageController.add(null);
  }

  insertRacer(Racer racer) {
    bool repeatedNumber = false;

    racers.forEach((racerChecked) {
      if (racerChecked.number == racer.number) {
        repeatedNumber = true;
      }
    });
    if (!repeatedNumber) {
      racers.add(racer);
      sharedPreferencesController.saveRacers(racers);
    } else
      AlertDialogStreamController.alertDialogController.add(AlertDialogProps(
          error: "Number Already in Use",
          message: "Please select another number"));

    if (!repeatedNumber)
      RefreshPageStreamController.refreshPageController.add(null);
  }

  static deleteRacer(Racer racerToBeDeleted) {
    StorageController sharedPreferencesController = StorageController();
    racers.removeWhere((racer) => racer.number == racerToBeDeleted.number);
    sharedPreferencesController.saveRacers(racers);
    RefreshPageStreamController.refreshPageController.add(null);
  }

  racerExist(int racerNumber) {
    Racer racer =
        racers.singleWhere((racer) => racer.number == racerNumber, orElse: () {
      return null;
    });
    if (racer != null) return racer;

    AlertDialogStreamController.alertDialogController.add(AlertDialogProps(
        error: "Inexistent Racer",
        message: "There is no reacer with this number"));
  }
}
