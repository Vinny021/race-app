import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:race_app/app/controllers/race_controller.dart';
import 'package:race_app/app/controllers/racers_controller.dart';
import 'package:race_app/app/dtos/racer_dto.dart';

class RacersRegister extends StatefulWidget {
  @override
  _RacersRegisterState createState() => _RacersRegisterState();
}

class _RacersRegisterState extends State<RacersRegister> {
  RacersController racersController = RacersController();
  RaceController raceController = RaceController();
  final TextEditingController racerNumberController = TextEditingController();
  bool isButtonDisabled = true;

  @override
  void initState() {
    isButtonDisabled = true;
    racerNumberController.addListener(() {
      checkIfButtonCanBeEnabled();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: MediaQuery.of(context).size.width * 0.3,
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: 'Racer N°',
          ),
          textAlign: TextAlign.center,
          controller: racerNumberController,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
        ),
      ),
      SizedBox(
        height: 8,
      ),
      ElevatedButton(
        onPressed: isButtonDisabled
            ? null
            : () {
                registerRacer();
              },
        child: Text('Insert Racer'),
        style: ElevatedButton.styleFrom(
            primary: isButtonDisabled
                ? Colors.grey
                : Theme.of(context).colorScheme.primary),
      )
    ]);
  }

  checkIfButtonCanBeEnabled() {
    (racerNumberController.text != '')
        ? setState(() {
            isButtonDisabled = false;
          })
        : setState(() {
            isButtonDisabled = true;
          });
  }

  registerRacer() {
    final int number = int.parse(racerNumberController.text);

    Racer racer = racersController.racerExist(number);

    if (racer is Racer) raceController.addRaceLog(racer);
    //Register racer on race controller
  }
}
