import 'package:peek/app/locator.dart';
import 'package:peek/model/response_model/user_profile_model.dart';
import 'package:peek/services/user_service.dart';
import 'package:stacked/stacked.dart';

class DashboardViewModel extends ReactiveViewModel {
  final _userService = locator<UserService>();
  UserProfileModel? get user => _userService.user;
  bool explore = false;
  void setExplore() {
    explore = true;
    notifyListeners();
  }

  @override
  // TODO: implement reactiveServices
  List<ListenableServiceMixin> get listenableServices => [_userService];
}
