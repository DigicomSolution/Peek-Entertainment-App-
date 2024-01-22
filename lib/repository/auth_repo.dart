import 'package:go_router/go_router.dart';

import '../app/locator.dart';
import '../helpers/constants/api_endpoints.dart';
import '../helpers/constants/app_storage_keys.dart';
import '../helpers/constants/routes.dart';
import '../helpers/helper_functions/dialog_service.dart';
import '../model/app/dialog_request_model.dart';
import '../model/enum.dart';
import '../model/response_model/api_response_model.dart';
import '../services/api/api_client.dart';
import '../services/app_services/app_state_service.dart';
import '../services/app_services/local_storage_service.dart';
import '../services/user_service.dart';

class AuthRepo {
  final _preferences = locator<LocalStorageService>();
  final _router = locator<GoRouter>();

  Future<void> login({required String email, required String password}) async {
    final body = {
      'email': email,
      'password': password,
    };
    final result = await ApiClient.post(ApiEndpoints.loginUser,
        body: body, useToken: false);
    if (result.statusCode == 200) {
      locator<AppStateService>().loginState = true;
      _preferences.saveDataToDisk(AppStorekeys.token, result.data["token"]);
      _preferences.saveDataToDisk(AppStorekeys.userId, result.data["id"]);
      if (result.data["isProfileCompleted"] == true) {
        await locator<UserService>().fetchUserProfile();
        _router.go(AppRoutes.homeView);
      } else {
        _router.go(AppRoutes.anonymousProfileView);
      }
    } else if (result.statusCode == 400) {
      await showBasicDialog(
          DialogRequestModel(
            title: result.message,
            variant: DialogType.basic,
            data: BasicDialogStatus.error,
            description: _getAuthMessage("${result.message}", email),
            mainButtonTitle: _getButtonMessage("${result.message}", email),
          ),
          onMainTap: null);
    }
  }

  void logout() {
    locator<AppStateService>().loginState = false;
    _preferences.removeDataFromDisk(AppStorekeys.token);
    _preferences.removeDataFromDisk(AppStorekeys.userId);
    _preferences.removeDataFromDisk(AppStorekeys.user);
    _router.go(AppRoutes.startUp);
  }

  String _getButtonMessage(String data, String email) {
    var message = "";
    if (data.toLowerCase().contains("password")) {
      message = "Try Again";
    }
    if (data.toLowerCase().contains("email")) {
      message = "Try Again";
    }
    if (data.toLowerCase().contains("activated")) {
      message = "Resend";
    }
    return message;
  }

  String _getAuthMessage(String data, String email) {
    var message = "";
    if (data.toLowerCase().contains("password")) {
      message =
          "Password provided is invalid, several attempt with incorrect password will disable your account";
    }
    if (data.toLowerCase().contains("email")) {
      message =
          "Email provided is invalid, no account is registered with provided email";
    }
    if (data.toLowerCase().contains("activated")) {
      message = "Account is not Activated, check $email for verification link";
    }
    return message;
  }

  static Future<ApiResponse> register({required Object userModel}) async {
    print(userModel);
    final result = await ApiClient.post(ApiEndpoints.registerUser,
        body: userModel, useToken: false);
    return result;
  }
}
