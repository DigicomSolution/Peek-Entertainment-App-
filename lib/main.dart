import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:peek/app/app.dart';

import 'app/locator.dart';

void main() {
  run();
}

void run() async {
  runZonedGuarded(() async {
    debugRepaintRainbowEnabled = false;
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    await setUpLocator();
    runApp(PeekMobile());
  }, (error, stack) {});
}
