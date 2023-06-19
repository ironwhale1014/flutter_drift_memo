import 'dart:io';

import 'package:drift_train/image_util/image_util.dart';
import 'package:drift_train/main.dart';
import 'package:drift_train/pages/image_page.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class LoadImage extends StatefulWidget {
  const LoadImage({Key? key}) : super(key: key);

  @override
  State<LoadImage> createState() => _LoadImageState();
}

class _LoadImageState extends State<LoadImage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("photo"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const ImagePage()))
                      .then((value) {
                    setState(() {});
                  });
                },
                icon: const Icon(Icons.camera))
          ],
        ),
        body: FutureBuilder(
          future: imageUtil.imageLoad("folder"),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return (imageUtil.isImage)
                  ? InkWell(
                      onTap: () => imageUtil.imageDelete("folder"),
                      child: ExtendedImage.file(
                        snapshot.data!,
                        key: UniqueKey(),
                        enableLoadState: true,
                      ),
                    )
                  : Container();
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }

// Future<File> loadImage() async {
//   Directory directory = await getApplicationDocumentsDirectory();
//   imagePath = directory.path;
//   _isImage = await File("$imagePath/save.png").exists();
//   return File("$imagePath/save.png");
// }
//
// void deleteImage() async {
//   await File("$imagePath/save.png").delete();
//   _isImage = false;
//   setState(() {});
// }
}
