import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:race_app/app/dtos/race_dto.dart';
import 'package:race_app/app/dtos/racer_dto.dart';

class StorageController {
  Future<String> get localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get racersFile async {
    final path = await localPath;
    return File('$path/racers.txt');
  }

  Future<File> get raceFile async {
    final path = await localPath;
    return File('$path/race.txt');
  }

  saveRacers(List<Racer> racers) async {
    final File file = await racersFile;

    var listOfJson = racers.map((racer) => racer.toJson()).toList();
    var jsonEncoded = json.encode(listOfJson);

    await file.writeAsString(jsonEncoded);

    await loadRacers();
  }

  saveRace(Race race) async{
    List<Race> races = [race];
    
    final File file = await raceFile;

    var listOfJson = races.map((race) => race.toJson()).toList();
    var jsonEncoded = json.encode(listOfJson);

    await file.writeAsString(jsonEncoded);

    await loadRace();
  }

  loadRacers() async {
    File file = await racersFile;
    String sharedRacers;

    try {
      sharedRacers = await file.readAsString() ?? '[]';
    } catch (e) {
      sharedRacers = '[]';
    }

    List<dynamic> listOfJson = json.decode(sharedRacers);
    var listOfRacers =
        listOfJson.map((racer) => Racer().fromJson(racer)).toList();

    return listOfRacers;
  }

  loadRace() async {
    File file = await raceFile;
    String sharedRace;

    try{
      sharedRace = await file.readAsString() ?? '[]';
    }catch (e) {
      sharedRace = '[]';
    }

    List<dynamic> raceJson = json.decode(sharedRace);
    List<Race> race =
        raceJson.map((race) => Race().fromJson(race)).toList();

    return race;
  }
}
