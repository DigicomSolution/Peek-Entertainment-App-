import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peek/helpers/constants/assets.dart';
import 'package:peek/helpers/constants/colors.dart';
import 'package:peek/helpers/extensions/build_context/text_theme.dart';
import 'package:peek/ui/views/dashboard_view/dashboard_viewmodel.dart';
import 'package:peek/ui/widgets/custom_button.dart';
import 'package:stacked/stacked.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
        viewModelBuilder: () => DashboardViewModel(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: AppColors.deepBlack,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: AppColors.deepBlack,
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome,",
                        style: context.textTheme.titleMedium
                            ?.copyWith(color: AppColors.textGrey),
                      ),
                      Text(
                        "Anonymous123",
                        style: context.textTheme.titleSmall
                            ?.copyWith(color: AppColors.textGrey),
                      )
                    ],
                  ),
                ),
                actions: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT583_HWz1qEN6hCuKJZ4aqOZQtr5C8lShJk1JiEcLdV2OFi1w0iY3YoN8bqw&s"),
                        // Placeholder for users without an image
                        child: Text('User'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  )
                ],
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(40),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    color: AppColors.normalBlack,
                    child: Row(
                      children: [
                        Text(
                          "What’s on your mind?",
                          style: context.textTheme.labelLarge,
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.add_circle_outline_outlined,
                          color: AppColors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              body: model.explore
                  ? Padding(
                      padding: const EdgeInsets.all(14),
                      child: ListView(
                        children: const [
                          HomePageExploreCard(
                            name: 'John Doe',
                            imageUrl:
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT583_HWz1qEN6hCuKJZ4aqOZQtr5C8lShJk1JiEcLdV2OFi1w0iY3YoN8bqw&s",
                            caption:
                                "Lorem ipsum dolor sit amet consectetur. Vitae nunc egestas consectetur etiam laoreet velit eu commodo fermentum. Turpis dui amet in eu egestas dignissim tincidunt velit gravida. consectetur. Vitae nunc egestas consectetur etiam laoreet velit eu commodo fermentum. Turpis dui amet in eu egestas dignissim tincidunt velit gravida. ",
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          HomePageExploreCard(
                            name: 'Tyler Swift',
                            imageUrl:
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdzK5S9Oykm8HngtnKj76uClPksD94LIVStmGNki_pBQ&s",
                            caption:
                                "eu velit gravctetur etiam laoreet velit eu commodo fermentum. Turpis dui amet in eu egestas dignissim tincidunt velit gravida. ",
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          HomePageExploreCard(
                            name: 'Conner Simi',
                            imageUrl:
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFdjV7B8hn16qTbYPFzZVRiYLXX1k0bpdx6xTGzpIRZm9PxAPrQXLku8kXEw&s",
                            caption:
                                "sit amet consectetur. Vitae nunc egestas consectetur etiam laoreet velit eu commodo fermentum. Turpis dui amet in eu egestas dignissim tincidunt velit gravida. consectetur. Vitae nunc egestas consectetur etiam laoreet velit eu commodo fermentum. Turpis dui amet in eu egestas dignissim tincidunt velit gravida. ",
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          HomePageExploreCard(
                            name: 'John Doe',
                            imageUrl:
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT583_HWz1qEN6hCuKJZ4aqOZQtr5C8lShJk1JiEcLdV2OFi1w0iY3YoN8bqw&s",
                            caption:
                                "ommodo fermentum. Turpis dui amet in eu egestas dignissim tincidunt velit gravida. consectetur. Vitae nunc egestas consectetur etiam laoreet velit eu commodo fermentum. Turpis dui amet in eu egestas dignissim tincidunt velit gravida. ",
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          HomePageExploreCard(
                            name: 'Tyler Swift',
                            imageUrl:
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdzK5S9Oykm8HngtnKj76uClPksD94LIVStmGNki_pBQ&s",
                            caption:
                                " Vitae nunc egestas consectetur etiam laoreet velit eu commodo fermentum. Turpis dui amet in eu egestas dignissim tincidunt velit gravida. consectetur. Vitae nunc egestas consectetur etiam laoreet velit eu commodo fermentum. Turpis dui amet in eu egestas dignissim tincidunt velit gravida. ",
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                              child: SvgPicture.asset(AppAssets.homeViewEmpty)),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Nothing to see yet!",
                            style: context.textTheme.titleSmall
                                ?.copyWith(color: AppColors.white),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Click on explore to add creators and get to see happenings on your feeds.",
                            textAlign: TextAlign.center,
                            style: context.textTheme.labelMedium
                                ?.copyWith(color: AppColors.white),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomButton(text: "Explore", onTap: model.setExplore)
                        ],
                      ),
                    ),
            ));
  }
}

class HomePageExploreCard extends StatelessWidget {
  const HomePageExploreCard({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.caption,
  });
  final String name;
  final String imageUrl;
  final String caption;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.normalBlack,
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundImage: NetworkImage(imageUrl),
                // Placeholder for users without an image
                child: const Text('User'),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                name,
                style: context.textTheme.titleSmall?.copyWith(
                  color: AppColors.white,
                ),
              ),
              const Spacer(),
              Text(
                "21 mins ago",
                style: context.textTheme.labelMedium?.copyWith(
                  color: AppColors.textGrey,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.more_horiz_rounded,
                color: AppColors.textGrey,
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            caption,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.labelLarge?.copyWith(letterSpacing: 0.5),
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Read More",
              textAlign: TextAlign.start,
              style: context.textTheme.titleMedium
                  ?.copyWith(color: AppColors.buttonColor),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 130,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      imageUrl,
                    ))),
          )
        ],
      ),
    );
  }
}
