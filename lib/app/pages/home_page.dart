import 'dart:async';

import 'package:flutter/material.dart';
import 'package:race_app/app/components/racer_input.dart';
import 'package:race_app/app/dialogs/alert_dialog.dart';
import 'package:race_app/app/streams/alert_dialog_stram_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StreamSubscription alertDialogSubscription;

  @override
  void initState() {
    super.initState();
    alertDialogSubscription =
        AlertDialogStreamController.alertDialogStream.listen((_) {
      CallAlertDialog.showAlertDialog(context);
    });
  }

  @override
  void dispose() {
    alertDialogSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Racers'),
      ),
      body: Center(
        child: Column(
          children: [RacerInput(), Divider()],
        ),
      ),
    );
  }
}
