import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../helpers/constants/colors.dart';
import '../helpers/constants/theme.dart';
import 'locator.dart';

class PeekMobile extends StatelessWidget {
  PeekMobile({super.key});
  final _router = locator<GoRouter>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(title: "Peek Mobile",routerConfig: _router,
      theme: AppThemes.main(primaryColor: AppColors.primaryColorOptions[0]),
      debugShowCheckedModeBanner: false,
    );
  }
}
