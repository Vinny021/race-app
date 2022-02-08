import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:race_app/app/dtos/racer_dto.dart';
import 'package:race_app/app/streams/refresh_page_stream.dart';

class SharedPreferencesController {
  Future<String> get localPath async {
    final directory = await getApplicationDocumentsDirectory();
    print(directory.parent);
    print(directory.absolute);

    return directory.path;
  }

  Future<File> get racersFile async {
    final path = await localPath;
    return File('$path/racers.txt');
  }

  saveRacers(List<Racer> racers) async {
    final File file = await racersFile;
    print(file.parent);
    print(file.absolute);

    var listOfJson = racers.map((racer) => racer.toJson()).toList();
    var jsonEncoded = json.encode(listOfJson);

    await file.writeAsString(jsonEncoded);

    await loadRacers();
  }

  loadRacers() async {
    List<Racer> racers = [];
    final file = await racersFile;

    String sharedRacers = await file.readAsString() ?? '[]';
    List<dynamic> listOfJson = json.decode(sharedRacers);
    var listOfRacers = listOfJson.map((racer) => Racer().fromJson(racer)).toList();

    return listOfRacers;
  }
}
