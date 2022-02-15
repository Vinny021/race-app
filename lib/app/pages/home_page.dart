import 'dart:async';

import 'package:flutter/material.dart';
import 'package:race_app/app/components/racer_input.dart';
import 'package:race_app/app/components/racers_list.dart';
import 'package:race_app/app/components/start_race_button.dart';
import 'package:race_app/app/controllers/racers_controller.dart';
import 'package:race_app/app/controllers/storage_controller.dart';
import 'package:race_app/app/dialogs/alert_dialog.dart';
import 'package:race_app/app/streams/alert_dialog_stram_controller.dart';
import 'package:race_app/app/streams/delete_racer_stream_controller.dart';
import 'package:race_app/app/streams/refresh_page_stream.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StreamSubscription alertDialogSubscription;
  StreamSubscription deleteRacerSubscription;
  StreamSubscription refreshPageSubscription;
  RacersController racersController = RacersController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await racersController.loadRacers();
    });

    alertDialogSubscription =
        AlertDialogStreamController.alertDialogStream.listen((_) {
      CallAlertDialog.showAlertDialog(context);
    });

    deleteRacerSubscription =
        DeleteRacerStreamController.deleteRacerStream.listen((racer) {
      CallAlertDialog.verifyDeleteAction(context, racer);
    });

    refreshPageSubscription =
        RefreshPageStreamController.refreshPageStream.listen((_) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    alertDialogSubscription?.cancel();
    deleteRacerSubscription?.cancel();
    refreshPageSubscription?.cancel();
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
          children: [
            RacerInput(),
            Divider(),
            Expanded(
              child: Container(
                child: ListView(
                  shrinkWrap: true,
                  physics: AlwaysScrollableScrollPhysics(),
                  children: [RacersList()],
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(bottom: 38),
                child: StartRaceButton())
          ],
        ),
      ),
    );
  }
}
