import 'dart:async';

import 'package:race_app/app/dtos/alert_dialog_props_dto.dart';

class AlertDialogStreamController {
  static StreamController<AlertDialogProps> alertDialogController =
      StreamController<AlertDialogProps>.broadcast();
  static Stream<AlertDialogProps> alertDialogStream = alertDialogController.stream;
}
