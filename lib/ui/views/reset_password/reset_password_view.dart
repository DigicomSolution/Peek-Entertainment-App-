import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:peek/helpers/extensions/build_context/build_context.dart';
import 'package:peek/ui/views/reset_password/reset_password_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../../helpers/constants/colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_form_field.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ResetPasswordViewModel>.reactive(
        viewModelBuilder: () => ResetPasswordViewModel(),
        builder: (context, model, child) => Scaffold(
              resizeToAvoidBottomInset: false,
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
              body: GestureDetector(
                onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: context.heightPercent(0.06),
                      ),
                      Text(
                        "Reset Password",
                        style: context.textTheme.titleLarge
                            ?.copyWith(color: AppColors.white),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      CustomTextFormField(
                        label: "New Password",
                        controller: model.newPasswordController,
                        isPassword: true,
                        max: 1,
                        isObscure: model.isVisible,
                        onTap: model.toggleVisibility,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextFormField(
                        label: "Confirm Password",
                        controller: model.confirmPasswordController,
                        isPassword: true,
                        max: 1,
                        isObscure: model.isVisible,
                        onTap: model.toggleVisibility,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      CustomButton(text: "Save", onTap: () {}),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
