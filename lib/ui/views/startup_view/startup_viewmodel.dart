import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stacked/stacked.dart';

import '../../../app/locator.dart';
import '../../../helpers/constants/routes.dart';

class StartUpViewModel extends BaseViewModel {
  final _router = locator<GoRouter>();
  void startUp(BuildContext context) async {
    // if (!_appState.initialized) return
      _router.go(AppRoutes.splashScreen);
  }
}