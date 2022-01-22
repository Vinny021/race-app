import 'package:flutter/material.dart';
import 'package:race_app/app/controllers/racers_controller.dart';

class RacersList extends StatefulWidget {
  @override
  _RacersListState createState() => _RacersListState();
}

class _RacersListState extends State<RacersList> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (var racer in RacersController.racers)
            Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Flexible(
                child: ListTile(
                  contentPadding: EdgeInsets.only(left: 10, right: 10),
                  title: Text(racer.name),
                  subtitle: Text(racer.number.toString()),
                  onTap: () {},
                ),
              )
            ])
        ],
      ),
    );
  }
}
