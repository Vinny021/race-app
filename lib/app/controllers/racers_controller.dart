import 'package:race_app/app/dtos/racer_dto.dart';
import 'package:race_app/app/streams/alert_dialog_stram_controller.dart';
import 'package:race_app/app/streams/refresh_page_stream.dart';

class RacersController {
  static List<Racer> racers = [];

  static insertRacer(Racer racer) {
    bool repeatedNumber = false;

    racers.forEach((racerChecked) {
      if (racerChecked.number == racer.number) {
        repeatedNumber = true;
      }
    });
    (!repeatedNumber)
        ? racers.add(racer)
        : AlertDialogStreamController.alertDialogController.add(null);

    if (!repeatedNumber)
      RefreshPageStreamController.refreshPageController.add(null);
  }

  static deleteRacer(Racer racerToBeDeleted) {
    racers.removeWhere((racer) => racer.number == racerToBeDeleted.number);
    RefreshPageStreamController.refreshPageController.add(null);
  }
}
