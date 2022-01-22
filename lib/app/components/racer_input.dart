import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RacerInput extends StatefulWidget {
  @override
  _RacerInputState createState() => _RacerInputState();
}

class _RacerInputState extends State<RacerInput> {
  final TextEditingController racerNameController = TextEditingController();
  final TextEditingController racerNumberController = TextEditingController();
  bool isButtonDisabled = true;

  @override
  void initState() {
    isButtonDisabled = true;
    racerNameController.addListener(() {
      checkIfButtonCanBeEnabled();
    });
    racerNumberController.addListener(() {
      checkIfButtonCanBeEnabled();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: TextField(
                  onChanged: checkIfButtonCanBeEnabled(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your name',
                  ),
                  controller: racerNameController,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your number',
                  ),
                  controller: racerNumberController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
          ElevatedButton(
            onPressed: isButtonDisabled
                ? null
                : () {
                    print('Adding Racer...');
                  },
            child: Text('Insert Racer'),
            style: ElevatedButton.styleFrom(
                primary: isButtonDisabled
                    ? Colors.grey
                    : Theme.of(context).colorScheme.primary),
          )
        ],
      ),
    );
  }

  checkIfButtonCanBeEnabled() {
    print(racerNameController.text);
    print(racerNumberController.text);
    (racerNameController.text != '' && racerNumberController.text != '')
        ? setState(() {
            isButtonDisabled = false;
          })
        : setState(() {
            isButtonDisabled = true;
          });
  }
}
