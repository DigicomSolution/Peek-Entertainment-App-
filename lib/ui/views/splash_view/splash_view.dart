import 'package:flutter/material.dart';
import 'package:peek/helpers/constants/assets.dart';
import 'package:peek/helpers/constants/colors.dart';
import 'package:peek/helpers/extensions/build_context/media_query.dart';
import 'package:peek/helpers/extensions/build_context/text_theme.dart';
import 'package:peek/ui/views/splash_view/splash_viewmodel.dart';
import 'package:peek/ui/widgets/custom_button.dart';
import 'package:stacked/stacked.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
        viewModelBuilder: () => SplashViewModel(),
        builder: (context, model, child) => Scaffold(
              body: Container(
                height: context.heightPercent(1),
                padding: const EdgeInsets.all(10),
                width: context.widthPercent(1),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AppAssets.splashBg),
                        fit: BoxFit.cover)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Anonymous Adventures \nAwait",
                      textAlign: TextAlign.left,
                      style: context.textTheme.headlineSmall
                          ?.copyWith(color: AppColors.white),
                    ),
                    SizedBox(
                      height: context.heightPercent(0.04),
                    ),
                    Text(
                      "Discover discretely, people you can bond with and enjoy each other’s company via Peek’s mobile app. ",
                      style: context.textTheme.titleLarge?.copyWith(
                          color: AppColors.white, fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: context.heightPercent(0.1),
                    ),
                    CustomButton(
                        text: "Get Started", onTap: model.goToTermsView),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ));
  }
}
