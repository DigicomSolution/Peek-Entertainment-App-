import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:peek/helpers/constants/assets.dart';
import 'package:peek/helpers/constants/colors.dart';
import 'package:peek/helpers/extensions/build_context/media_query.dart';
import 'package:peek/helpers/extensions/build_context/text_theme.dart';
import 'package:peek/ui/views/verification/verification_viewmodel.dart';
import 'package:peek/ui/widgets/custom_button.dart';
import 'package:stacked/stacked.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VerificationViewModel>.reactive(
        viewModelBuilder: () => VerificationViewModel(),
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
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Enter the 4 digit verification code sent \nto your email address. ",
                      style: context.textTheme.labelLarge,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SvgPicture.asset(AppAssets.verificationSvg),
                    const SizedBox(
                      height: 20,
                    ),
                    PinCodeFields(
                      length: 4,
                      fieldBorderStyle: FieldBorderStyle.square,
                      responsive: true,
                      fieldHeight: context.heightPercent(0.08),
                      borderWidth: 2.0,
                      activeBorderColor: Colors.transparent,
                      activeBackgroundColor:
                          AppColors.lightBerge.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(10.0),
                      keyboardType: TextInputType.number,
                      autoHideKeyboard: false,
                      fieldBackgroundColor: AppColors.deepBlack,
                      borderColor: AppColors.white,
                      textStyle: context.textTheme.titleLarge!
                          .copyWith(color: AppColors.buttonColor),
                      onComplete: (output) {
                        // Your logic with pin code
                        print(output);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(text: "Verify", onTap: model.goToSuccessView),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Resend code again",
                          style: context.textTheme.labelLarge
                              ?.copyWith(color: AppColors.textGrey),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Change email address",
                          style: context.textTheme.labelLarge
                              ?.copyWith(color: AppColors.textGrey),
                        )),
                  ],
                ),
              ),
            ));
  }
}
