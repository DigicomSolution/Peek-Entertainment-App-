import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ResetPasswordViewModel extends BaseViewModel {
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isVisible = true;
  void toggleVisibility() {
    isVisible = !isVisible;
    notifyListeners();
  }
}
