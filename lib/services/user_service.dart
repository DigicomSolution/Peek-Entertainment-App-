import 'package:peek/model/response_model/user_profile_model.dart';
import 'package:peek/repository/user_repo.dart';
import 'package:stacked/stacked.dart';

import '../app/locator.dart';
import '../helpers/constants/app_storage_keys.dart';
import 'app_services/local_storage_service.dart';

class UserService with ListenableServiceMixin {
  final _storage = locator<LocalStorageService>();
  final _user = ReactiveValue<UserProfileModel?>(null);

  UserProfileModel? get user => _user.value;
  UserService() {
    listenToReactiveValues([_user]);
  }

  set setLocalUser(UserProfileModel state) {
    _storage.saveDataToDisk(AppStorekeys.user, state);
    _user.value = state;
    notifyListeners();
  }

  Future<void> fetchUserProfile() async {
    final data = _storage.getDataFromDisk(AppStorekeys.user);
    if (data == null) {
      final result = await UserRepo.getUserProfile();
      if (result.statusCode == 200) {
        _storage.saveDataToDisk(
            AppStorekeys.user, UserProfileModel.fromJson(result.data));
        _user.value = UserProfileModel.fromJson(result.data);
        notifyListeners();
      }
    } else {
      _user.value = data;
      notifyListeners();
    }
  }
}
