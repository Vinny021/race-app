import 'package:flutter/material.dart';
import 'package:race_app/app/components/racer_input.dart';

class HomePage extends StatelessWidget {
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
            Divider()
          ],
        ),
      ),
    );
  }
}
