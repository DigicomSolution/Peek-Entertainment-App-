import 'package:flutter/material.dart';
import 'package:peek/ui/views/explore/explore_view.dart';
import 'package:peek/ui/views/message/message_view.dart';
import 'package:stacked/stacked.dart';

import '../../../app/locator.dart';
import '../../../services/user_service.dart';
import '../dashboard_view/dashboard_view.dart';
import '../notification/notification_view.dart';

class HomeViewModel extends BaseViewModel implements Initialisable {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  void setIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return const DashboardView();
      case 1:
        return const ExploreView();
      case 2:
        return const MessageView();

      case 3:
        return const NotificationView();
      default:
        return const DashboardView();
    }
  }

  @override
  Future<void> initialise() async {
    await locator<UserService>().fetchUserProfile();
  }
}
