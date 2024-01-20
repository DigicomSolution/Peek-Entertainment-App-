import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:peek/app/router.dart';

import '../services/app_services/app_state_service.dart';
import '../services/app_services/local_storage_service.dart';
GetIt locator = GetIt.instance;
Future setUpLocator() async {
  var instance = await LocalStorageService.getInstance();
  locator.registerSingleton<LocalStorageService>(instance);
  locator.registerSingleton<GoRouter>(router());
  locator.registerSingleton(AppStateService());
}