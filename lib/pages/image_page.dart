import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ImagePage extends StatefulWidget {
  ImagePage({Key? key}) : super(key: key);

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? selectedImage;

  String? _savedPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("image Page"),
        actions: [
          IconButton(onPressed: _pickImage, icon: const Icon(Icons.camera))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: _deleteImage,
            child: Center(
                child: (selectedImage == null)
                    ? const Text('No select Image')
                    : Image.file(File(selectedImage!.path))),
          ),
          const SizedBox(height: 10),
          (selectedImage == null)
              ? Container()
              : ElevatedButton(onPressed: _saveImage, child: const Text("Save"))
        ],
      ),
    );
  }

  Future<void> _pickImage() async {
    selectedImage = await _imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  void _deleteImage() {
    selectedImage = null;
    setState(() {});
  }

  Future<void> _saveImage() async {
    Navigator.pop(context,true);
    Directory directory = await getApplicationDocumentsDirectory();
    _savedPath = directory.path;
    await selectedImage!.saveTo("$_savedPath/save.png");
  }
}
