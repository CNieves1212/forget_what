import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
// import 'package:flutter/foundation.dart';

class Storage {

  // gets local path to storage space on phone
  Future<String> get localPath async {
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  // writes a file into that 
  Future<File> getLocalFile(String filename) async {
    final path = await localPath;
    return File('$path/$filename.txt');
  }

  Future<String> readData(String filename) async {
    try {
      final file = await getLocalFile(filename);
      String body = await file.readAsString();
      return body;
    }
    catch (e) {
  return e.toString();
    }
  }

  Future<File> writeData(String filename, String data) async {
    final file = await getLocalFile(filename);
    return file.writeAsString('$data');
  }

}