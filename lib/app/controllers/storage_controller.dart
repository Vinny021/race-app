import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
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

  saveRacers(List<Racer> racers) async {
    final File file = await racersFile;

    var listOfJson = racers.map((racer) => racer.toJson()).toList();
    var jsonEncoded = json.encode(listOfJson);

    await file.writeAsString(jsonEncoded);

    await loadRacers();
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
}
