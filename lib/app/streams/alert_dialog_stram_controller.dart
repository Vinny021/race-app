import 'dart:async';

class AlertDialogStreamController {
  static StreamController<void> alertDialogController =
      StreamController<void>.broadcast();
  static Stream alertDialogStream = alertDialogController.stream;
}
