import 'package:drift_train/image_util/image_util.dart';
import 'package:drift_train/router/router.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

final logger = Logger();
final myRouter = MyRouter();
final ImageUtil imageUtil = ImageUtil();

void main() async {
  runApp(const MyApp());
  await imageUtil.init();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: myRouter.router,
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.amber,
            primary: Colors.orangeAccent,
            background: Colors.grey[50],
            secondary: Colors.blue,
          )),
    );
  }
}
