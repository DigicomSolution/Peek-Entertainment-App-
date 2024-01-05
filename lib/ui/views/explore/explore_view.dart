import 'package:flutter/material.dart';
import 'package:peek/helpers/extensions/build_context/build_context.dart';
import 'package:peek/ui/views/explore/explore_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../../helpers/constants/colors.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ExploreViewModel>.reactive(
        viewModelBuilder: () => ExploreViewModel(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: AppColors.deepBlack,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                centerTitle: false,
                backgroundColor: AppColors.deepBlack,
                title: Text(
                  "Explore",
                  style: context.textTheme.titleMedium
                      ?.copyWith(color: AppColors.white),
                ),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(30),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SizedBox(
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
                  ),
                ),
              ),
            ));
  }
}
