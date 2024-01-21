import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:peek/app/locator.dart';
import 'package:peek/helpers/constants/routes.dart';
import 'package:stacked/stacked.dart';

import '../../../repository/auth_repo.dart';

class SignupViewModel extends BaseViewModel {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? _errorText;
  String? get errorText => _errorText;

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

  void signUp() async {
    if (formKey.currentState!.validate()) {
      setBusy(true);
      final data = {
        "firstName": firstNameController.text,
        "lastName": lastNameController.text,
        "email": emailController.text,
        "password": passwordController.text
      };
      final result = await AuthRepo.register(userModel: data);
      if (result.statusCode == 201) {
        setBusy(false);
        locator<GoRouter>().push(
          AppRoutes.verificationView,
        );
      } else if(result.statusCode == 422) {
        if (result.message!.toLowerCase().contains("already taken")) {
          _errorText = "Email not available";
          notifyListeners();
        }
      }
      setBusy(false);
      notifyListeners();
    }
  }
}
