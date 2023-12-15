import 'package:flutter/material.dart';
import 'package:peek/helpers/constants/colors.dart';
import 'package:peek/helpers/extensions/build_context/media_query.dart';
import 'package:peek/helpers/extensions/build_context/text_theme.dart';
import 'package:peek/ui/views/terms_and_privacy/terms_and_privacy_viewmodel.dart';
import 'package:peek/ui/widgets/custom_button.dart';
import 'package:stacked/stacked.dart';

class TermsAndPrivacyView extends StatelessWidget {
  const TermsAndPrivacyView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TermsAndPrivacyViewModel>.reactive(
        viewModelBuilder: () => TermsAndPrivacyViewModel(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: AppColors.deepBlack,
              body: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: context.heightPercent(0.1),
                    ),
                    Text(
                      "Welcome to Peek",
                      style: context.textTheme.titleLarge
                          ?.copyWith(color: AppColors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Please adhere to the following House \nRules.",
                      style: context.textTheme.labelLarge
                          ?.copyWith(color: AppColors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.check_circle_outline_outlined,
                        color: AppColors.buttonColor,
                      ),
                      contentPadding: EdgeInsets.zero,
                      minLeadingWidth: 8,
                      title: RichText(
                          text: TextSpan(
                              text: 'Be yourself -',
                              style: context.textTheme.titleSmall
                                  ?.copyWith(color: AppColors.white),
                              children: [
                            TextSpan(
                              text:
                                  ' make sure your photos, age, and bio are true and reflect who you are.',
                              style: context.textTheme.labelLarge
                                  ?.copyWith(color: AppColors.white),
                            )
                          ])),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.check_circle_outline_outlined,
                        color: AppColors.buttonColor,
                      ),
                      contentPadding: EdgeInsets.zero,
                      minLeadingWidth: 8,
                      title: RichText(
                          text: TextSpan(
                              text: 'Stay safe -',
                              style: context.textTheme.titleSmall
                                  ?.copyWith(color: AppColors.white),
                              children: [
                            TextSpan(
                              text:
                                  ' don’t be too quick to give out your personal information.',
                              style: context.textTheme.labelLarge
                                  ?.copyWith(color: AppColors.white),
                            )
                          ])),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.check_circle_outline_outlined,
                        color: AppColors.buttonColor,
                      ),
                      contentPadding: EdgeInsets.zero,
                      minLeadingWidth: 8,
                      title: RichText(
                          text: TextSpan(
                              text: 'Play it cool -',
                              style: context.textTheme.titleSmall
                                  ?.copyWith(color: AppColors.white),
                              children: [
                            TextSpan(
                              text:
                                  ' respect others and treat them how you’d like to be treated.',
                              style: context.textTheme.labelLarge
                                  ?.copyWith(color: AppColors.white),
                            )
                          ])),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.check_circle_outline_outlined,
                        color: AppColors.buttonColor,
                      ),
                      contentPadding: EdgeInsets.zero,
                      minLeadingWidth: 8,
                      title: RichText(
                          text: TextSpan(
                              text: 'Be proactive -',
                              style: context.textTheme.titleSmall
                                  ?.copyWith(color: AppColors.white),
                              children: [
                            TextSpan(
                              text: ' always report bad behavior.',
                              style: context.textTheme.labelLarge
                                  ?.copyWith(color: AppColors.white),
                            )
                          ])),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RichText(
                        text: TextSpan(
                            text: 'By clicking on “I Accept” you agree to our',
                            style: context.textTheme.titleSmall
                                ?.copyWith(color: AppColors.white),
                            children: [
                          TextSpan(
                            text: ' Terms of Service',
                            style: context.textTheme.titleSmall
                                ?.copyWith(color: AppColors.buttonColor),
                          ),
                          TextSpan(
                            text: ' and',
                            style: context.textTheme.labelLarge
                                ?.copyWith(color: AppColors.white),
                          ),
                          TextSpan(
                            text: ' Privacy Policy',
                            style: context.textTheme.titleSmall
                                ?.copyWith(color: AppColors.buttonColor),
                          ),
                        ])),
                    const Spacer(),
                    CustomButton(text: "I Accept", onTap: model.goToSignUpView),
                    SizedBox(
                      height: context.heightPercent(0.05),
                    ),
                  ],
                ),
              ),
            ));
  }
}
