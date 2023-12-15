import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peek/helpers/constants/assets.dart';
import 'package:peek/helpers/extensions/build_context/build_context.dart';
import 'package:peek/ui/views/signup/signup_viewmodel.dart';
import 'package:peek/ui/widgets/custom_button.dart';
import 'package:peek/ui/widgets/custom_text_form_field.dart';
import 'package:stacked/stacked.dart';

import '../../../helpers/constants/colors.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignupViewModel>.reactive(
        viewModelBuilder: () => SignupViewModel(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: AppColors.deepBlack,
              body: GestureDetector(
                onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: context.heightPercent(0.1),
                      ),
                      Text(
                        "Sign Up",
                        style: context.textTheme.titleLarge
                            ?.copyWith(color: AppColors.white),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextFormField(
                          label: "First Name",
                          controller: model.firstNameController),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextFormField(
                          label: "Last Name",
                          controller: model.lastNameController),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextFormField(
                        label: "Email Address",
                        controller: model.emailController,
                        textInputType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextFormField(
                        label: "Password",
                        controller: model.passwordController,
                        isPassword: true,
                        max: 1,
                        isObscure: model.isVisible,
                        onTap: model.toggleVisibility,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      CustomButton(
                          text: "Sign Up", onTap: model.goToVerification),
                      const SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: InkWell(
                          onTap: model.goToLogin,
                          child: RichText(
                              text: TextSpan(
                                  text: 'Already have an account? ',
                                  style: context.textTheme.labelLarge
                                      ?.copyWith(color: AppColors.white),
                                  children: [
                                TextSpan(
                                  text: 'Log In',
                                  style: context.textTheme.titleSmall
                                      ?.copyWith(color: AppColors.buttonColor),
                                ),
                              ])),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Or continue with",
                            style: context.textTheme.labelLarge
                                ?.copyWith(color: AppColors.textGrey),
                          )),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AppAssets.googleSvg),
                          SizedBox(
                            width: context.widthPercent(0.2),
                          ),
                          SvgPicture.asset(AppAssets.facebookSvg),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}