import 'dart:async';

import 'package:race_app/app/dtos/racer_dto.dart';

class DeleteRacerStreamController {
  static StreamController<Racer> deleteRacerController =
      StreamController<Racer>.broadcast();
  static Stream<Racer> deleteRacerStream = deleteRacerController.stream;
}
