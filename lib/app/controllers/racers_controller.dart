import 'package:flutter/material.dart';
import 'package:race_app/app/dtos/racer_dto.dart';

class RacersController {
  static List<Racer> racers = [];

  static insertRacer(Racer racer) {
    bool repeatedNumber = false;

    racers.forEach((racerChecked) {
      if (racerChecked.number == racer.number) {
        repeatedNumber = true;
      }
    });
    (!repeatedNumber) ? racers.add(racer) : AlertDialog();
    
  }
}
