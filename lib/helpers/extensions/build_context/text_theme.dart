import 'package:flutter/material.dart';

extension BuildContextTextTheme on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}
