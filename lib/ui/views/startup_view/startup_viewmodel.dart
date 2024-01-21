import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:stacked/stacked.dart';

import '../../../app/locator.dart';
import '../../../helpers/constants/routes.dart';
import '../../../services/app_services/app_state_service.dart';

class StartUpViewModel extends ReactiveViewModel {
  final _appState = locator<AppStateService>();
  final _router = locator<GoRouter>();
  void startUp(BuildContext context) async {
    await _appState.onAppStart();
    if (_appState.loginState) {
      return _router.go(AppRoutes.homeView);
    }
    if (!_appState.initialized) return _router.go(AppRoutes.splashScreen);
    if (!_appState.loginState) return _router.go(AppRoutes.loginView);
  }

  @override
  // TODO: implement reactiveServices
  List<ListenableServiceMixin> get listenableServices => [_appState];
}
