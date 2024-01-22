import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:peek/app/locator.dart';
import 'package:peek/helpers/constants/colors.dart';
import 'package:peek/helpers/extensions/build_context/media_query.dart';
import 'package:peek/helpers/extensions/build_context/text_theme.dart';
import 'package:peek/ui/views/profile/profile_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
        viewModelBuilder: () => ProfileViewModel(),
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
                  "My Profile",
                  style: context.textTheme.titleSmall
                      ?.copyWith(color: AppColors.white),
                ),
              ),
              body: Column(
                children: [
                  Container(
                    color: AppColors.normalBlack,
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  image: const DecorationImage(
                                      image: NetworkImage(
                                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT583_HWz1qEN6hCuKJZ4aqOZQtr5C8lShJk1JiEcLdV2OFi1w0iY3YoN8bqw&s"),
                                      fit: BoxFit.cover)),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${model.user?.name}",
                                    style: context.textTheme.labelLarge
                                        ?.copyWith(color: AppColors.white)),
                                Text(
                                  "@${model.user?.userName}",
                                  style: context.textTheme.labelSmall
                                      ?.copyWith(color: AppColors.white),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "0 Likes",
                              style: context.textTheme.labelMedium
                                  ?.copyWith(color: AppColors.white),
                            ),
                            SizedBox(
                              width: context.widthPercent(0.1),
                            ),
                            Text(
                              "0 Saves",
                              style: context.textTheme.labelMedium
                                  ?.copyWith(color: AppColors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          leading: const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Icon(
                              Icons.rocket_launch_outlined,
                              color: AppColors.buttonColor,
                            ),
                          ),
                          minLeadingWidth: 0,
                          horizontalTitleGap: 10,
                          title: Text(
                            "Become a creator",
                            style: context.textTheme.labelLarge
                                ?.copyWith(color: AppColors.buttonColor),
                          ),
                          subtitle: Text(
                            "Start earning money from Peek",
                            style: context.textTheme.labelMedium
                                ?.copyWith(color: AppColors.textGrey),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: context.widthPercent(0.05),
                            color: AppColors.buttonColor,
                          ),
                        ),
                        const Divider(
                          color: AppColors.white,
                        ),
                        ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          onTap: model.goToProfileDetails,
                          leading: const Icon(
                            Icons.account_circle_outlined,
                            color: AppColors.white,
                          ),
                          minLeadingWidth: 0,
                          horizontalTitleGap: 10,
                          title: Text(
                            "Personal details",
                            style: context.textTheme.labelLarge
                                ?.copyWith(color: AppColors.white),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: context.widthPercent(0.05),
                            color: AppColors.white,
                          ),
                        ),
                        const Divider(
                          color: AppColors.white,
                        ),
                        ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          leading: const Icon(
                            Icons.add_card_outlined,
                            color: AppColors.white,
                          ),
                          minLeadingWidth: 0,
                          horizontalTitleGap: 10,
                          title: Text(
                            "Payment card ",
                            style: context.textTheme.labelLarge
                                ?.copyWith(color: AppColors.white),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: context.widthPercent(0.05),
                            color: AppColors.white,
                          ),
                        ),
                        const Divider(
                          color: AppColors.white,
                        ),
                        ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          leading: const Icon(
                            Icons.help_outline_outlined,
                            color: AppColors.white,
                          ),
                          minLeadingWidth: 0,
                          horizontalTitleGap: 10,
                          title: Text(
                            "Help and support",
                            style: context.textTheme.labelLarge
                                ?.copyWith(color: AppColors.white),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: context.widthPercent(0.05),
                            color: AppColors.white,
                          ),
                        ),
                        const Divider(
                          color: AppColors.white,
                        ),
                        ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          leading: const Icon(
                            Icons.settings_outlined,
                            color: AppColors.white,
                          ),
                          minLeadingWidth: 0,
                          horizontalTitleGap: 10,
                          title: Text(
                            "Settings",
                            style: context.textTheme.labelLarge
                                ?.copyWith(color: AppColors.white),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: context.widthPercent(0.05),
                            color: AppColors.white,
                          ),
                        ),
                        const Divider(
                          color: AppColors.white,
                        ),
                        ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          leading: const Icon(
                            Icons.policy_outlined,
                            color: AppColors.white,
                          ),
                          minLeadingWidth: 0,
                          horizontalTitleGap: 10,
                          title: Text(
                            "Terms & Policies",
                            style: context.textTheme.labelLarge
                                ?.copyWith(color: AppColors.white),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: context.widthPercent(0.05),
                            color: AppColors.white,
                          ),
                        ),
                        const Divider(
                          color: AppColors.white,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: model.logout,
                          child: Row(
                            children: const [
                              Icon(
                                Icons.logout_outlined,
                                color: AppColors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Log Out")
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ));
  }
}
