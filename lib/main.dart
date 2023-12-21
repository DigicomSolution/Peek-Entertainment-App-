import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:peek/app/app.dart';

import 'app/locator.dart';

void main() {
  run();
}

void run() async {
  runZonedGuarded(() async {
    debugRepaintRainbowEnabled = false;
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    await setUpLocator();
    runApp(PeekMobile());
  }, (error, stack) {});
}
