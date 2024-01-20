import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stacked/stacked.dart';

import '../../../app/locator.dart';
import '../../../helpers/constants/routes.dart';
import '../../../repository/auth_repo.dart';

class LoginViewModel extends BaseViewModel {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isVisible = true;
  void toggleVisibility() {
    isVisible = !isVisible;
    notifyListeners();
  }

  void goToSignUpView() {
    locator<GoRouter>().push(AppRoutes.signupView);
  }

  void goToHomeView() {
    locator<GoRouter>().push(AppRoutes.homeView);
  }

  void goToForgotPassword() {
    locator<GoRouter>().push(AppRoutes.forgotPasswordView);
  }

  void login() async {
    if (formKey.currentState!.validate()) {
      setBusy(true);
      await AuthRepo().login(
          email: emailController.text.trim(),
          password: passwordController.text,);
      setBusy(false);
    }
  }
}
