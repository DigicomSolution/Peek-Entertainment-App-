import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:peek/helpers/extensions/build_context/build_context.dart';
import 'package:peek/ui/views/profile_details/profile_details_viewmodel.dart';
import 'package:peek/ui/widgets/custom_text_form_field.dart';
import 'package:stacked/stacked.dart';

import '../../../app/locator.dart';
import '../../../helpers/constants/assets.dart';
import '../../../helpers/constants/colors.dart';
import '../../../helpers/utils/form_validation.dart';
import '../../widgets/custom_button.dart';

class ProfileDetailsView extends StatelessWidget {
  const ProfileDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileDetailsViewModel>.reactive(
        viewModelBuilder: () => ProfileDetailsViewModel(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: AppColors.deepBlack,
              appBar: AppBar(
                backgroundColor: AppColors.deepBlack,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: AppColors.white,
                    size: 18,
                  ),
                  onPressed: () => locator<GoRouter>().pop(),
                ),
                centerTitle: false,
                title: Text(
                  "Personal Details",
                  style: context.textTheme.titleSmall
                      ?.copyWith(color: AppColors.white),
                ),
              ),
              body: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.normalBlack,
                          radius: 45, // Adjust the size as needed
                          child: ClipOval(
                            child: Image.file(
                              File(
                                  "file://${model.userPersonalDetailsModel?.imageUrl}"),
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
                                    ?.copyWith(color: AppColors.buttonColor),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: context.heightPercent(0.05),
                    ),
                    CustomTextFormField(
                        label: "First Name",
                        validate: FormValidation.stringValidation,
                        controller: model.firstNameController),
                    SizedBox(
                      height: context.heightPercent(0.03),
                    ),
                    CustomTextFormField(
                        label: "Last Name",
                        validate: FormValidation.stringValidation,
                        controller: model.lastNameController),
                    SizedBox(
                      height: context.heightPercent(0.03),
                    ),
                    CustomTextFormField(
                      label: "Email Address",
                      controller: model.emailController,
                      errorText: model.errorText,
                      validate: FormValidation.emailValidation,
                      textInputType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: context.heightPercent(0.03),
                    ),
                    CustomTextFormField(
                      label: "Email Address",
                      controller: model.emailController,
                      errorText: model.errorText,
                      validate: FormValidation.emailValidation,
                      textInputType: TextInputType.emailAddress,
                    ),
                    const Spacer(),
                    model.isBusy
                        ? const Center(
                            child: CircularProgressIndicator(
                            color: AppColors.buttonColor,
                          ))
                        : CustomButton(text: "Update", onTap: () {}),
                    SizedBox(
                      height: context.heightPercent(0.03),
                    ),
                  ],
                ),
              ),
            ));
  }
}
