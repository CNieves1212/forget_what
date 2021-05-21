import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:forget_what/services/authentication_services.dart';

final AuthenticationService _firebaseAuth = AuthenticationService();
String uid = _firebaseAuth.getUID();

class Storage {

  // gets local path to storage space on phone
  Future<String> get localPath async {
    final dir = await getApplicationDocumentsDirectory();
    // print("localPath " + dir.path);
    return dir.path;
  }

  // gets path locations where it will actually write files based on
  // uid and filename
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

  Future<File> writeData(String filename, String data, int fileModeFlag) async {
    final file = await getLocalFile("$filename");
    FileMode mode;
    if(fileModeFlag == 0) {mode = FileMode.write;}
    else {mode = FileMode.append;}
    // print("writeData writing to: $file/");
    return file.writeAsString('$data', mode: mode);
  }

  // ignore: missing_return
  Future<void> deleteFile(String filename) async {
    try {
      final file = await getLocalFile(filename);
      await file.delete();
    } catch (e) {
      print(e.toString());
    }
  }

  // following functions are modifed from above to read fileNames 


}