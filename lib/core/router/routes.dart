import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../pages/home/view/homeview.dart';
import '../../pages/login/view/loginview.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      pageBuilder: (_, state) {
        return _setPageRoute(state.pageKey, LoginView());
      },
      routes: <GoRoute>[
        GoRoute(
          path: 'home',
          pageBuilder: (_, state) {
            return _setPageRoute(state.pageKey, const HomeView());
          },
        ),
        GoRoute(
          path: 'login',
          pageBuilder: (_, state) {
            return _setPageRoute(state.pageKey, LoginView());
          },
        ),
      ],
    ),
  ],
  debugLogDiagnostics: kDebugMode,
);

Page<dynamic> _setPageRoute(LocalKey pageKey, Widget child) {
  return MaterialPage(key: pageKey, child: child);
}
