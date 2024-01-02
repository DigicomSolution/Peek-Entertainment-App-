import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peek/helpers/constants/assets.dart';
import 'package:peek/helpers/constants/colors.dart';
import 'package:peek/helpers/extensions/build_context/media_query.dart';
import 'package:peek/helpers/extensions/build_context/text_theme.dart';
import 'package:peek/ui/views/notification/notification_viewmodel.dart';
import 'package:stacked/stacked.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NotificationViewModel>.reactive(
        viewModelBuilder: () => NotificationViewModel(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: AppColors.deepBlack,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                centerTitle: false,
                backgroundColor: AppColors.deepBlack,
                title: Text(
                  "Notifications",
                  style: context.textTheme.titleMedium
                      ?.copyWith(color: AppColors.white),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(5),
                child: model.notifications.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AppAssets.notificationEmpty),
                            const Text("No notifications yet!")
                          ],
                        ),
                      )
                    : ListView(
                        children: [
                          SizedBox(
                            height: context.heightPercent(0.05),
                            child: TextFormField(
                              controller: model.searchController,
                              keyboardType: TextInputType.text,
                              style: context.textTheme.labelLarge
                                  ?.copyWith(color: AppColors.white),
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: AppColors.normalBlack,
                                  labelText: "Search",
                                  labelStyle: const TextStyle(
                                      color: AppColors.textGrey, fontSize: 14),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        color: AppColors
                                            .buttonColor), // Orange border when focused
                                  ),
                                  suffixIcon: const Icon(
                                    Icons.search_outlined,
                                    color: AppColors.white,
                                  )),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: AppColors.normalBlack,
                                borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                              minVerticalPadding: 4,
                              minLeadingWidth: 0,
                              leading: Container(
                                width: 10,
                                height: 10,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.buttonColor),
                              ),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Admin",
                                    style: context.textTheme.titleSmall
                                        ?.copyWith(
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    "Your profile is still yet to be updated with your peek profile picture",
                                    style: context.textTheme.labelMedium
                                        ?.copyWith(color: AppColors.textGrey),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.calendar_today_outlined,
                                        color: AppColors.buttonColor,
                                        size: 13,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Nov 24, 2023",
                                        style: context.textTheme.labelMedium
                                            ?.copyWith(color: AppColors.white),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: AppColors.normalBlack,
                                borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                              minLeadingWidth: 0,
                              minVerticalPadding: 4,
                              leading: Container(
                                width: 10,
                                height: 10,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.buttonColor),
                              ),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Subscription successful",
                                    style: context.textTheme.titleSmall
                                        ?.copyWith(
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    "Your profile is still yet to be updated with your peek profile picture",
                                    style: context.textTheme.labelMedium
                                        ?.copyWith(color: AppColors.textGrey),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.calendar_today_outlined,
                                        color: AppColors.buttonColor,
                                        size: 13,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Nov 24, 2023",
                                        style: context.textTheme.labelMedium
                                            ?.copyWith(color: AppColors.white),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: AppColors.normalBlack,
                                borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                              minLeadingWidth: 0,
                              minVerticalPadding: 4,
                              leading: Container(
                                width: 10,
                                height: 10,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.buttonColor),
                              ),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Subscription Expired",
                                    style: context.textTheme.titleSmall
                                        ?.copyWith(
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    "Your profile is still yet to be updated with your peek profile picture",
                                    style: context.textTheme.labelMedium
                                        ?.copyWith(color: AppColors.textGrey),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.calendar_today_outlined,
                                        color: AppColors.buttonColor,
                                        size: 13,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Nov 24, 2023",
                                        style: context.textTheme.labelMedium
                                            ?.copyWith(color: AppColors.white),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: AppColors.normalBlack,
                                borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                              minLeadingWidth: 0,
                              minVerticalPadding: 4,
                              leading: Container(
                                width: 10,
                                height: 10,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.buttonColor),
                              ),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Subscription Renewed",
                                    style: context.textTheme.titleSmall
                                        ?.copyWith(
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    "Your profile is still yet to be updated with your peek profile picture",
                                    style: context.textTheme.labelMedium
                                        ?.copyWith(color: AppColors.textGrey),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.calendar_today_outlined,
                                        color: AppColors.buttonColor,
                                        size: 13,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Nov 24, 2023",
                                        style: context.textTheme.labelMedium
                                            ?.copyWith(color: AppColors.white),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: AppColors.normalBlack,
                                borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                              minLeadingWidth: 0,
                              minVerticalPadding: 4,
                              leading: Container(
                                width: 10,
                                height: 10,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.buttonColor),
                              ),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Payment completed",
                                    style: context.textTheme.titleSmall
                                        ?.copyWith(
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    "Your profile is still yet to be updated with your peek profile picture",
                                    style: context.textTheme.labelMedium
                                        ?.copyWith(color: AppColors.textGrey),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.calendar_today_outlined,
                                        color: AppColors.buttonColor,
                                        size: 13,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Nov 24, 2023",
                                        style: context.textTheme.labelMedium
                                            ?.copyWith(color: AppColors.white),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
              ),
            ));
  }
}
