import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peek/helpers/constants/assets.dart';
import 'package:peek/helpers/extensions/build_context/build_context.dart';
import 'package:peek/ui/views/verify_identity/verify_identity_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../../helpers/constants/colors.dart';
import '../../widgets/custom_button.dart';

class VerifyIdentityView extends StatelessWidget {
  const VerifyIdentityView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VerifyIdentityViewModel>.reactive(
        viewModelBuilder: () => VerifyIdentityViewModel(),
        builder: (context, model, child) => Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: AppColors.deepBlack,
              body: GestureDetector(
                onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: context.heightPercent(0.1),
                      ),
                      Text(
                        "Lastly, verify your \nIdentity",
                        style: context.textTheme.titleLarge
                            ?.copyWith(color: AppColors.white),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Take a photo of your ID card",
                        style: context.textTheme.labelLarge
                            ?.copyWith(color: AppColors.white),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Please provide us with a good photo of your ID card. Make sure to capture both sides and photograph the ENTIRE ID in your card.",
                        style: context.textTheme.labelMedium
                            ?.copyWith(color: AppColors.textGrey),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      Center(
                        child: SizedBox(
                          width: context.widthPercent(0.5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(AppAssets.idCardSvg),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.bolt_outlined,
                                    color: AppColors.white,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "No Flash",
                                    style: context.textTheme.labelLarge,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.light_mode_outlined,
                                    color: AppColors.white,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Use a light room",
                                    style: context.textTheme.labelLarge,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.camera_alt_outlined,
                                    color: AppColors.white,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Hold the camera stable",
                                    maxLines: 2,
                                    style: context.textTheme.labelLarge,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      CustomButton(
                        text: "Take a photo",
                        onTap: () async {
                          XFile? image = await model.takePicture();
                          model.showPreview(image, context);
                        },
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
