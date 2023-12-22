import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peek/helpers/constants/assets.dart';
import 'package:peek/helpers/constants/colors.dart';
import 'package:peek/helpers/extensions/build_context/media_query.dart';
import 'package:peek/helpers/extensions/build_context/text_theme.dart';
import 'package:peek/ui/widgets/custom_button.dart';
import 'package:stacked/stacked.dart';

import 'identity_verification_success_viewmodel.dart';

class IdentityVerificationSuccessView extends StatelessWidget {
  const IdentityVerificationSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<IdentityVerificationSuccessViewModel>.reactive(
        viewModelBuilder: () => IdentityVerificationSuccessViewModel(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: AppColors.white,
              body: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppAssets.successSvg),
                    SizedBox(
                      height: context.heightPercent(0.08),
                    ),
                    Text(
                      "Success",
                      textAlign: TextAlign.center,
                      style: context.textTheme.titleLarge
                          ?.copyWith(color: AppColors.normalBlack),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "You have successfully uploaded your valid ID. You may proceed to login to your Peek’s account now.",
                      textAlign: TextAlign.center,
                      style: context.textTheme.labelMedium
                          ?.copyWith(color: AppColors.normalBlack),
                    ),
                    SizedBox(
                      height: context.heightPercent(0.1),
                    ),
                    CustomButton(
                        text: "Proceed to Login", onTap: model.goToLogin)
                  ],
                ),
              ),
            ));
  }
}
