import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peek/helpers/constants/assets.dart';
import 'package:peek/helpers/extensions/build_context/build_context.dart';
import 'package:peek/ui/views/anonymous_profile/anonymous_profile_viewmodel.dart';
import 'package:peek/ui/widgets/custom_button.dart';
import 'package:stacked/stacked.dart';

import '../../../helpers/constants/colors.dart';
import '../../widgets/custom_text_form_field.dart';

class AnonymousProfileView extends StatelessWidget {
  const AnonymousProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AnonymousProfileViewModel>.reactive(
        viewModelBuilder: () => AnonymousProfileViewModel(),
        builder: (context, model, child) => Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: AppColors.deepBlack,
              body: GestureDetector(
                onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: context.heightPercent(0.1),
                      ),
                      Text(
                        "Setup an anonymous \nProfile",
                        style: context.textTheme.titleLarge
                            ?.copyWith(color: AppColors.white),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      CustomTextFormField(
                        label: "Username",
                        controller: model.userNameController,
                        textInputType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      Text(
                        "Upload an image",
                        style: context.textTheme.titleSmall
                            ?.copyWith(color: AppColors.white),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      model.image != null
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundColor: AppColors.normalBlack,
                                  radius: 85, // Adjust the size as needed
                                  child: ClipOval(
                                    child: Image.file(
                                      File(model.image!.path),
                                      width: context.widthPercent(
                                          0.6), // Adjust the width/height to fit the circle
                                      height: context.heightPercent(0.2),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                  onTap: () => model.removeImage(),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(AppAssets.editSvg),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Change photo",
                                        style: context.textTheme.labelLarge
                                            ?.copyWith(
                                                color: AppColors.buttonColor),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          : InkWell(
                              onTap: () => model.pickImage(),
                              child: Container(
                                width: context.widthPercent(0.9),
                                color: AppColors.fillColor,
                                child: DottedBorder(
                                  color: AppColors.white,
                                  padding: const EdgeInsets.all(20),
                                  strokeWidth: 1,
                                  dashPattern: const [
                                    10,
                                    3,
                                  ],
                                  borderType: BorderType.RRect,
                                  child: Center(
                                    child: Column(
                                      children: const [
                                        Icon(
                                          Icons.add,
                                          color: AppColors.white,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text("Select a photo")
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                      const Spacer(),
                      CustomButton(text: "Continue", onTap: () {}),
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
