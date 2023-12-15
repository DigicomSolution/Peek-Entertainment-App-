import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel{
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isVisible = true;
  void toggleVisibility() {
    isVisible = !isVisible;
    notifyListeners();
  }
}