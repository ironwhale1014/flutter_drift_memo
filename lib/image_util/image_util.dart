import 'dart:io';

import 'package:drift_train/main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ImageUtil {
  final ImagePicker _imagePicker;
  Future<Directory>? _directory;
  Directory? _appDirectory;
  String? _savePath;
  XFile? _selectedImage;
  bool _isImage = false;

  bool get isImage => _isImage;

  ImageUtil() : _imagePicker = ImagePicker() {
    _directory = getApplicationDocumentsDirectory();
  }

  Future<void> init() async {
    if (_appDirectory == null) {
      _appDirectory = await _directory;
      _savePath = _appDirectory!.path;
    }
  }

  // 사진 갤러리에서 불러오기
  Future<XFile?> pickImageFromGallery() async {
    _selectedImage = await _imagePicker.pickImage(source: ImageSource.gallery);
    return _selectedImage;
  }

  // 이미지를 앱에 저장 #id/0/jpg
  Future<void> imageSave(String folder) async {
    if (await Directory("$_savePath/$folder").exists() == false) {
      await Directory("$_savePath/$folder").create(recursive: true);
      logger.d("save");
    }
    await _selectedImage!.saveTo("$_savePath/$folder/0.jpg");
  }

  // 앱에 저장된 이미지를 불러오기  #id/0/jpg
  Future<File> imageLoad(String folder) async {
    _isImage = await File("$_savePath/$folder/0.jpg").exists();
    return File("$_savePath/$folder/0.jpg");
  }

  //저장된 이미지 삭제
  void imageDelete(String folder) async {
    await File("$_savePath/$folder/0.jpg").delete();
    _isImage = false;
  }
}
