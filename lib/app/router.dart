import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:peek/ui/views/anonymous_profile/anonymous_profile_view.dart';
import 'package:peek/ui/views/chat/chat_view.dart';
import 'package:peek/ui/views/forgot_password/forgot_password_view.dart';
import 'package:peek/ui/views/home/home_view.dart';
import 'package:peek/ui/views/identity_verification_success_view/identity_verification_success_view.dart';
import 'package:peek/ui/views/login/login_view.dart';
import 'package:peek/ui/views/reset_password/reset_password_view.dart';
import 'package:peek/ui/views/signup/signup_view.dart';
import 'package:peek/ui/views/splash_view/splash_view.dart';
import 'package:peek/ui/views/startup_view/startup_view.dart';
import 'package:peek/ui/views/terms_and_privacy/terms_and_privacy_view.dart';
import 'package:peek/ui/views/verification/verification_view.dart';
import 'package:peek/ui/views/verify_identity/verify_identity_view.dart';

import '../helpers/constants/routes.dart';
import '../ui/views/verification_success/verification_success_view.dart';

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
      builder: (BuildContext context, GoRouterState state) =>
          const VerificationView(),
    ),
    GoRoute(
      name: AppRoutes.verificationSuccessView,
      path: AppRoutes.verificationSuccessView,
      builder: (BuildContext context, GoRouterState state) =>
          const VerificationSuccessView(),
    ),
    GoRoute(
      name: AppRoutes.forgotPasswordView,
      path: AppRoutes.forgotPasswordView,
      builder: (BuildContext context, GoRouterState state) =>
          const ForgotPasswordView(),
    ),
    GoRoute(
      name: AppRoutes.resetPasswordView,
      path: AppRoutes.resetPasswordView,
      builder: (BuildContext context, GoRouterState state) =>
          const ResetPasswordView(),
    ),
    GoRoute(
      name: AppRoutes.anonymousProfileView,
      path: AppRoutes.anonymousProfileView,
      builder: (BuildContext context, GoRouterState state) =>
          const AnonymousProfileView(),
    ),
    GoRoute(
      name: AppRoutes.verifyIdentityView,
      path: AppRoutes.verifyIdentityView,
      builder: (BuildContext context, GoRouterState state) =>
          const VerifyIdentityView(),
    ),
    GoRoute(
      name: AppRoutes.verifyIdentitySuccessView,
      path: AppRoutes.verifyIdentitySuccessView,
      builder: (BuildContext context, GoRouterState state) =>
          const IdentityVerificationSuccessView(),
    ),
    GoRoute(
      name: AppRoutes.homeView,
      path: AppRoutes.homeView,
      builder: (BuildContext context, GoRouterState state) => const HomeView(),
    ),
    GoRoute(
      name: AppRoutes.chatView,
      path: AppRoutes.chatView,
      builder: (BuildContext context, GoRouterState state) => const ChatView(),
    ),
  ]);
}
