import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StartRaceButton extends StatefulWidget {
  @override
  _StartRaceButtonState createState() => _StartRaceButtonState();
}

class _StartRaceButtonState extends State<StartRaceButton> {
  final TextEditingController numberOfLaps = TextEditingController();
  bool isButtonDisabled = true;

  @override
  void initState() {
    numberOfLaps.addListener(() {
      checkIfButtonCanBeEnabled();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('N° of Laps'),
        SizedBox(
          width: 10,
        ),
        Flexible(
          child: Container(
            height: 38,
            width: 50,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              controller: numberOfLaps,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        ElevatedButton(
            onPressed: isButtonDisabled
                ? null
                : () {
                    Navigator.pushNamed(context, '/race');
                  },
            child: Text('Start Race'),
            style: ElevatedButton.styleFrom(
                primary: isButtonDisabled
                    ? Colors.grey
                    : Theme.of(context).colorScheme.primary)),
      ],
    );
  }

  void checkIfButtonCanBeEnabled() {
    print(numberOfLaps.text);
    (numberOfLaps.text == '')
        ? setState(() {
            isButtonDisabled = true;
          })
        : setState(() {
            isButtonDisabled = false;
          });
  }
}
