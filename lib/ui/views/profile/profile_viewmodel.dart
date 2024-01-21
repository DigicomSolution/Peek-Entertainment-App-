import 'package:peek/repository/auth_repo.dart';
import 'package:stacked/stacked.dart';

class ProfileViewModel extends BaseViewModel {
  void logout() {
    AuthRepo().logout();
  }
}
