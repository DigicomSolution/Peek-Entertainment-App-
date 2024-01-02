import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:peek/app/locator.dart';
import 'package:peek/helpers/constants/routes.dart';
import 'package:stacked/stacked.dart';

class MessageViewModel extends BaseViewModel {
  final searchController = TextEditingController();
  List<String> messages = ["fff"];

  void goToChatView() {
    locator<GoRouter>().push(AppRoutes.chatView);
  }
}
