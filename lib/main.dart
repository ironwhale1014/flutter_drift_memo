import 'package:drift_train/home_page.dart';
import 'package:drift_train/router/router.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

final logger = Logger();
final myRouter = MyRouter();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: myRouter.router,
    );
  }
}
