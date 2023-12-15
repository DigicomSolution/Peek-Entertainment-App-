import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:peek/app/locator.dart';
import 'package:peek/helpers/constants/routes.dart';
import 'package:stacked/stacked.dart';

class SignupViewModel extends BaseViewModel {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isVisible = true;
  void toggleVisibility() {
    isVisible = !isVisible;
    notifyListeners();
  }

  void goToLogin() {
    locator<GoRouter>().push(AppRoutes.loginView);
  }

  void goToVerification() {
    locator<GoRouter>().push(AppRoutes.verificationView);
  }
}
