import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:peek/ui/views/splash_view/splash_view.dart';
import 'package:peek/ui/views/startup_view/startup_view.dart';

import '../helpers/constants/routes.dart';

GoRouter router() {
  return GoRouter(routes: <GoRoute>[
    GoRoute(
      name: AppRoutes.startUp,
      path: AppRoutes.startUp,
      builder: (BuildContext context, GoRouterState state) =>
          const StartUpView(),
    ),
    GoRoute(
      name: AppRoutes.splashScreen,
      path: AppRoutes.splashScreen,
      builder: (BuildContext context, GoRouterState state) =>
          const SplashView(),
    ),
  ]);
}
