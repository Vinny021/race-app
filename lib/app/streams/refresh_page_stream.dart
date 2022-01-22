import 'dart:async';

class RefreshPageStreamController {
  static StreamController<void> refreshPageController =
      StreamController<void>.broadcast();
  static Stream<void> refreshPageStream = refreshPageController.stream;
}
