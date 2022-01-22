import 'package:flutter/material.dart';
import 'package:race_app/app/controllers/racers_controller.dart';
import 'package:race_app/app/dtos/racer_dto.dart';

class CallAlertDialog {
  static showAlertDialog(BuildContext context) {
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Number Already in Use"),
      content: Text("Please select another number."),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static verifyDeleteAction(BuildContext context, Racer racer) {
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("Yes"),
      onPressed: () {
        RacersController.deleteRacer(racer);
        Navigator.pop(context);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Are you sure about delete racer:"),
      content: Text("${racer.name} - ${racer.number}"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
