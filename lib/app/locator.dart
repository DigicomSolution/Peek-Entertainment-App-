import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:peek/app/router.dart';
GetIt locator = GetIt.instance;
Future setUpLocator() async {
  locator.registerSingleton<GoRouter>(router());
}