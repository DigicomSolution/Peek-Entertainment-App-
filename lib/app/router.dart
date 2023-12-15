import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:peek/ui/views/login/login_view.dart';
import 'package:peek/ui/views/signup/signup_view.dart';
import 'package:peek/ui/views/splash_view/splash_view.dart';
import 'package:peek/ui/views/startup_view/startup_view.dart';
import 'package:peek/ui/views/terms_and_privacy/terms_and_privacy_view.dart';
import 'package:peek/ui/views/verification/verification_view.dart';

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
    GoRoute(
      name: AppRoutes.termsAndPrivacyView,
      path: AppRoutes.termsAndPrivacyView,
      builder: (BuildContext context, GoRouterState state) =>
          const TermsAndPrivacyView(),
    ),
    GoRoute(
      name: AppRoutes.signupView,
      path: AppRoutes.signupView,
      builder: (BuildContext context, GoRouterState state) =>
          const SignupView(),
    ),
    GoRoute(
      name: AppRoutes.loginView,
      path: AppRoutes.loginView,
      builder: (BuildContext context, GoRouterState state) => const LoginView(),
    ),
    GoRoute(
      name: AppRoutes.verificationView,
      path: AppRoutes.verificationView,
      builder: (BuildContext context, GoRouterState state) => const VerificationView(),
    ),
  ]);
}
