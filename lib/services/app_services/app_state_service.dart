import 'package:peek/helpers/constants/app_storage_keys.dart';
import 'package:stacked/stacked.dart';

import '../../app/locator.dart';
import '../../model/app/app_state.dart';
import 'local_storage_service.dart';

class AppStateService with ListenableServiceMixin {
  final _storage = locator<LocalStorageService>();
  final _state = ReactiveValue<AppState>(AppState());

  AppStateService() {
    listenToReactiveValues([_state]);
  }

  bool get loginState => _state.value.isLogged;
  bool get initialized => _state.value.isInit;
  bool get onboarding => _state.value.isOnboarded;

  set loginState(bool state) {
    _storage.saveDataToDisk(AppStorekeys.loginKey, state);
    _state.value.isLogged = state;
    notifyListeners();
  }

  set initialized(bool value) {
    _storage.saveDataToDisk(AppStorekeys.initializationKey, value);
    _state.value.isInit = value;
    notifyListeners();
  }

  set onboarding(bool value) {
    _storage.saveDataToDisk(AppStorekeys.firstInstallKey, value);
    _state.value.isOnboarded = value;
    notifyListeners();
  }

  Future<void> onAppStart() async {
    _state.value.isOnboarded =
        _storage.getDataFromDisk(AppStorekeys.firstInstallKey) ?? false;
    _state.value.isLogged =
        _storage.getDataFromDisk(AppStorekeys.loginKey) ?? false;
    _state.value.isInit =
        _storage.getDataFromDisk(AppStorekeys.initializationKey) ?? false;
    notifyListeners();
  }
}
