import 'package:go_router/go_router.dart';
import 'package:peek/helpers/constants/routes.dart';
import 'package:peek/repository/auth_repo.dart';
import 'package:stacked/stacked.dart';

import '../../../app/locator.dart';
import '../../../model/response_model/user_profile_model.dart';
import '../../../services/user_service.dart';

class ProfileViewModel extends ReactiveViewModel {
  final _userService = locator<UserService>();
  final _router = locator<GoRouter>();
  UserProfileModel? get user => _userService.user;
  void logout() {
    AuthRepo().logout();
  }

  void goToProfileDetails() {
    _router.push(AppRoutes.profileDetailsView);
  }

  @override
  // TODO: implement reactiveServices
  List<ListenableServiceMixin> get listenableServices => [_userService];
}
