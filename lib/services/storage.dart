import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:forget_what/services/authentication_services.dart';
// import 'package:flutter/foundation.dart';

final AuthenticationService _firebaseAuth = AuthenticationService();
String uid = _firebaseAuth.getUID();

class Storage {

  // gets local path to storage space on phone
  Future<String> get localPath async {
    final dir = await getApplicationDocumentsDirectory();
    // print("localPath " + dir.path);
    return dir.path;
  }

  // writes a file into that 
  Future<File> getLocalFile(String filename) async {
    final path = await localPath;
    // print("getLocalPath  $path/$uid/$filename");
    Directory("$path/$uid/").create();
    return File('$path/$uid/$filename');
  }

  Future<String> readData(String filename) async {
    try {
      final file = await getLocalFile(filename);
      String body = await file.readAsString();
      // print("readData reading $body from: $file/");
      return body;
    }
    catch (e) {
  return e.toString();
    }
  }

  Future<File> writeData(String filename, String data) async {
    final file = await getLocalFile("$filename");
    // print("writeData writing to: $file/");
    return file.writeAsString('$data');
  }

  // ignore: missing_return
  Future<int> deleteFile(String filename) async {
    try {
      final file = await getLocalFile(filename);

      await file.delete();
    } catch (e) {
      return 0;
    }
  }

}