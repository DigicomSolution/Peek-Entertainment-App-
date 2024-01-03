import 'package:stacked/stacked.dart';

class DashboardViewModel extends BaseViewModel {
  bool explore = false;
  void setExplore() {
    explore = true;
    notifyListeners();
  }
}
