import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:peek/helpers/constants/assets.dart';
import 'package:peek/helpers/extensions/build_context/media_query.dart';
import 'package:peek/helpers/extensions/build_context/text_theme.dart';
import 'package:peek/ui/views/forgot_password/forgot_password_viewmodel.dart';
import 'package:peek/ui/widgets/custom_button.dart';
import 'package:stacked/stacked.dart';

import '../../../helpers/constants/colors.dart';
import '../../widgets/custom_text_form_field.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForgotPasswordViewModel>.reactive(
        viewModelBuilder: () => ForgotPasswordViewModel(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: AppColors.deepBlack,
              appBar: AppBar(
                backgroundColor: AppColors.deepBlack,
                leading: InkWell(
                  onTap: context.pop,
                  child: const Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: AppColors.white,
                  ),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(AppAssets.lockSvg),
                    SizedBox(
                      height: context.heightPercent(0.05),
                    ),
                    Text(
                      "Enter your registered email address \nwith peek to reset your password",
                      style: context.textTheme.labelLarge
                          ?.copyWith(color: AppColors.textGrey),
                    ),
                    SizedBox(
                      height: context.heightPercent(0.05),
                    ),
                    CustomTextFormField(
                      label: "Email Address",
                      controller: model.emailController,
                      textInputType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: context.heightPercent(0.05),
                    ),
                    RichText(
                        text: TextSpan(
                            text: 'Didn’t receive the email? check your spam  ',
                            style: context.textTheme.labelLarge
                                ?.copyWith(color: AppColors.white),
                            children: [
                          TextSpan(
                            text: 'or try another email address.',
                            style: context.textTheme.titleSmall
                                ?.copyWith(color: AppColors.buttonColor),
                          ),
                        ])),
                    SizedBox(
                      height: context.heightPercent(0.2),
                    ),
                    CustomButton(text: "Reset Password", onTap: () {})
                  ],
                ),
              ),
            ));
  }
}
