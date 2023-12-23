import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../dashboard_view/dashboard_view.dart';
import '../notification/notification_view.dart';

class HomeViewModel extends BaseViewModel {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  void setIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return DashboardView();
      case 1:
        return Container();
      case 2:
        return Container();

      case 3:
        return NotificationView();
      default:
        return DashboardView();
    }
  }
}
