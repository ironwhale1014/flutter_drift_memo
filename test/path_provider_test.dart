import 'dart:io';

import 'package:drift_train/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider/path_provider.dart';

void main(){
  TestWidgetsFlutterBinding.ensureInitialized();

  Future<Directory>? _appDocumentsDirectory;

  test("get directory", ()async{
    _appDocumentsDirectory = getApplicationDocumentsDirectory();
    logger.d(await _appDocumentsDirectory);
  });
}