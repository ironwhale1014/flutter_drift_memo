import 'package:drift_train/home_page.dart';
import 'package:go_router/go_router.dart';

class MyRouter {
  late final GoRouter router;

  MyRouter() {
    router = GoRouter(routes: [
      GoRoute(path: '/', name: 'home', builder: (context, state) => HomePage()),
    ]);
  }
}
