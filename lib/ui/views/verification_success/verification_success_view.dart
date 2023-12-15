import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peek/helpers/constants/assets.dart';
import 'package:peek/helpers/constants/colors.dart';
import 'package:peek/helpers/extensions/build_context/media_query.dart';
import 'package:peek/helpers/extensions/build_context/text_theme.dart';
import 'package:peek/ui/views/verification_success/verification_success_viewmodel.dart';
import 'package:peek/ui/widgets/custom_button.dart';
import 'package:stacked/stacked.dart';

class VerificationSuccessView extends StatelessWidget {
  const VerificationSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VerificationSuccessViewModel>.reactive(
        viewModelBuilder: () => VerificationSuccessViewModel(),
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
                      "Email address successfully \nverified.",
                      textAlign: TextAlign.center,
                      style: context.textTheme.titleLarge
                          ?.copyWith(color: AppColors.normalBlack),
                    ),
                    SizedBox(
                      height: context.heightPercent(0.1),
                    ),
                    CustomButton(text: "Continue", onTap: () {})
                  ],
                ),
              ),
            ));
  }
}
