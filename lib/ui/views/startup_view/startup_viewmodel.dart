import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:stacked/stacked.dart';

import '../../../app/locator.dart';
import '../../../helpers/constants/routes.dart';

class StartUpViewModel extends BaseViewModel {
  final _router = locator<GoRouter>();
  void startUp(BuildContext context) async {
    // Adding a delay of 2 seconds using Future.delayed
    await Future.delayed(const Duration(seconds: 2));
    FlutterNativeSplash.remove();
    _router.go(AppRoutes.splashScreen);
  }
}
