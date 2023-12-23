import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peek/helpers/constants/assets.dart';
import 'package:peek/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../../helpers/constants/colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        builder: (context, model, child) => Scaffold(
            backgroundColor: AppColors.deepBlack,
            body: model.getViewForIndex(model.currentIndex),
            bottomNavigationBar: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: AppColors.normalBlack,
                elevation: 0,
                selectedItemColor: AppColors.buttonColor,
                unselectedItemColor: AppColors.white,
                currentIndex: model.currentIndex,
                onTap: model.setIndex,
                items: [
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(AppAssets.homeSvg),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(AppAssets.exploreSvg),
                    label: 'Explore',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(AppAssets.messageSvg),
                    label: 'Message',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(AppAssets.notificationSvg),
                    label: 'Notifications',
                  ),
                ],
              ),
            )));
  }
}
