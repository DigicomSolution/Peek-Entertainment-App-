import 'package:flutter/material.dart';
import 'package:peek/ui/views/startup_view/startup_viewmodel.dart';
import 'package:stacked/stacked.dart';

class StartUpView extends StatelessWidget {
  const StartUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartUpViewModel>.reactive(
        viewModelBuilder: () => StartUpViewModel(),
        onViewModelReady: (model) => model.startUp(context),
        builder: (context, model, child) => Scaffold());
  }
}
