import 'package:race_app/app/controllers/storage_controller.dart';
import 'package:race_app/app/dtos/racer_dto.dart';
import 'package:race_app/app/streams/alert_dialog_stram_controller.dart';
import 'package:race_app/app/streams/refresh_page_stream.dart';

class RacersController {
  StorageController sharedPreferencesController =
      StorageController();
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
      AlertDialogStreamController.alertDialogController.add(null);

    if (!repeatedNumber)
      RefreshPageStreamController.refreshPageController.add(null);
  }

  static deleteRacer(Racer racerToBeDeleted) {
    StorageController sharedPreferencesController =
        StorageController();
    racers.removeWhere((racer) => racer.number == racerToBeDeleted.number);
    sharedPreferencesController.saveRacers(racers);
    RefreshPageStreamController.refreshPageController.add(null);
  }
}
