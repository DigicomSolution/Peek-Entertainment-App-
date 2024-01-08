import 'package:flutter/material.dart';
import 'package:peek/ui/views/profile_details/profile_details_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ProfileDetailsView extends StatelessWidget {
  const ProfileDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileDetailsViewModel>.reactive(
        viewModelBuilder: () => ProfileDetailsViewModel(),
        builder: (context, model, child) => Scaffold());
  }
}
