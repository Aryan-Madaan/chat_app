import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class DataObject {
  late final Directory? directory;
  bool isInit = false;

  Future<Map<String, dynamic>> readData() async {
    if (!isInit) {
      directory = await getApplicationDocumentsDirectory();
    }
    isInit = true;
    var file = File('${directory!.path}/chat.json');
    // await file.delete();
    var myjson;
    if (file.existsSync()) {
      myjson = jsonDecode(file.readAsStringSync());
    }
    return myjson;
  }

  Future<void> writeData(Map<String, dynamic> myjson) async {
    if (!isInit) {
      directory = directory ?? await getApplicationDocumentsDirectory();
    }
    var file = File('${directory!.path}/chat.json');
    Map<String, dynamic>? myjson1;
    if (file.existsSync()) {
      myjson1 = jsonDecode(file.readAsStringSync());
      myjson1!.addEntries(myjson.entries);
    }
    myjson1 ??= myjson;
    file.writeAsStringSync(jsonEncode(myjson1), mode: FileMode.write);
  }
}
