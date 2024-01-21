import 'package:go_router/go_router.dart';

import '../app/locator.dart';
import '../helpers/constants/api_endpoints.dart';
import '../model/response_model/api_response_model.dart';
import '../services/api/api_client.dart';
import '../services/app_services/local_storage_service.dart';

class UserRepo {
  final _preferences = locator<LocalStorageService>();
  final _router = locator<GoRouter>();

  static Future<ApiResponse> createUserProfile(
      {required Object userModel}) async {
    final result = await ApiClient.post(ApiEndpoints.createUserProfile,
        body: userModel, useToken: true);
    return result;
  }

  static Future<ApiResponse> getUserProfile() async {
    final result =
        await ApiClient.get(ApiEndpoints.getUserProfile, useToken: true);
    return result;
  }
}
