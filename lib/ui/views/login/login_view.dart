import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:peek/helpers/extensions/build_context/build_context.dart';
import 'package:peek/ui/views/login/login_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../../helpers/constants/assets.dart';
import '../../../helpers/constants/colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_form_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(),
        builder: (context, model, child) => Scaffold(
              resizeToAvoidBottomInset: false,
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
                        "Login In",
                        style: context.textTheme.titleLarge
                            ?.copyWith(color: AppColors.white),
                      ),
                      const SizedBox(
                        height: 50,
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
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: model.goToForgotPassword,
                          child: Text(
                            "Forgot Password?",
                            style: context.textTheme.titleSmall
                                ?.copyWith(color: AppColors.buttonColor),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      CustomButton(text: "Login", onTap: model.goToHomeView),
                      const SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: InkWell(
                          onTap: model.goToSignUpView,
                          child: RichText(
                              text: TextSpan(
                                  text: 'Don’t have an account yet? ',
                                  style: context.textTheme.labelLarge
                                      ?.copyWith(color: AppColors.white),
                                  children: [
                                TextSpan(
                                  text: 'Sign Up',
                                  style: context.textTheme.titleSmall
                                      ?.copyWith(color: AppColors.buttonColor),
                                ),
                              ])),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Align(
                          alignment: Alignment.center,
                          child: Text("Or continue with")),
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
