import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:peek/app/locator.dart';
import 'package:peek/helpers/constants/routes.dart';
import 'package:stacked/stacked.dart';

class ForgotPasswordViewModel extends BaseViewModel {
  final emailController = TextEditingController();
  void goToResetPassword() {
    locator<GoRouter>().push(AppRoutes.resetPasswordView);
  }
}
