import 'package:drift_train/drift/drift_helper.dart';
import 'package:drift_train/home_page.dart';
import 'package:drift_train/pages/base_page.dart';
import 'package:drift_train/pages/update_page.dart';
import 'package:go_router/go_router.dart';

class MyRouter {
  late final GoRouter router;

  MyRouter() {
    router = GoRouter(routes: [
      GoRoute(path: '/', name: 'home', builder: (context, state) => const HomePage()),
      GoRoute(
          path: '/update',
          name: 'update',
          builder: (context, state) {
            Memo memo = state.extra as Memo;
            return UpdatePage(memo: memo);
          }),
      GoRoute(
          path: "/folder",
          name: "folder",
          builder: (context, state) {
            String folder = state.extra as String;
            return BasePage(folder: folder);
          })
    ]);
  }
}
