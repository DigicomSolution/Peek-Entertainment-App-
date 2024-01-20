import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';

import '../../app/locator.dart';
import '../../helpers/constants/api_endpoints.dart';
import '../../helpers/constants/app_storage_keys.dart';
import '../../helpers/utils/api_utils.dart';
import '../../model/response_model/api_response_model.dart';
import '../app_services/local_storage_service.dart';

class ApiClient {
  static final _dio = Dio(
    BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60)),
  );

  static final _defaultHeader = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };

  static String get _token => _getToken();
  static bool _refreshingToken = false;
  static int _refreshTokenRetries = 0;
  static bool get refreshingToken => _refreshingToken;
  // static void _addTokenInterceptor() {
  //   _dio.interceptors.add(QueuedInterceptorsWrapper(
  //     onRequest: (options, handler) async {
  //       options.headers['Authorization'] = 'Bearer $_token';
  //       // log(_token);
  //       return handler.next(options);
  //     },
  //     onError: (error, handler) async {
  //       if (error.response?.statusCode == 401) {
  //         try {
  //           String refreshToken = locator<LocalStorageService>()
  //               .getDataFromDisk(Keys.refreshToken);
  //           if (locator<LocalStorageService>()
  //               .getDataFromDisk(Keys.tokenExpiryDate) !=
  //               null) {
  //             DateTime expiryDate = DateTime.parse(
  //                 locator<LocalStorageService>()
  //                     .getDataFromDisk(Keys.tokenExpiryDate));
  //             bool tokenExpired = expiryDate.isBefore(DateTime(
  //                 DateTime.now().year,
  //                 DateTime.now().month,
  //                 DateTime.now().day,
  //                 DateTime.now().hour,
  //                 DateTime.now().minute));
  //             if (refreshToken.isNotEmpty && tokenExpired) {
  //               if (await _refreshToken()) {
  //                 error.requestOptions.headers['Authorization'] =
  //                 'Bearer ${_getToken()}';
  //                 return handler
  //                     .resolve(await _dio.fetch(error.requestOptions));
  //               }
  //             }
  //           } else {
  //             if (refreshToken.isNotEmpty) {
  //               if (await _refreshToken()) {
  //                 error.requestOptions.headers['Authorization'] =
  //                 'Bearer ${_getToken()}';
  //                 return handler
  //                     .resolve(await _dio.fetch(error.requestOptions));
  //               }
  //             }
  //           }
  //         } catch (error) {
  //           print('Token refresh failed: $error');
  //         }
  //       }
  //
  //       return handler.next(error);
  //     },
  //   ));
  // }

  static Future<ApiResponse> get(
      String endpoint, {
        Map<String, dynamic>? queryParameters,
        bool useToken = true,
      }) async {
    final result = await _makeRequest(
          () async {
        final header = _defaultHeader;
        if (useToken) {
          header.addAll(
            {'Authorization': 'Bearer $_token'},
          );
        }
        final options = Options(headers: header);
        final response = await _dio.get(endpoint,
            queryParameters: queryParameters, options: options);
        print("direct $response");
        return ApiUtils.toApiResponse(response);
      },
    );
    return result;
  }

  static Future<ApiResponse> post(
      String endpoint, {
        required dynamic body,
        bool useToken = true,
      }) async {
    final result = await _makeRequest(
          () async {
        final header = _defaultHeader;
        final options = Options(headers: header);
        if (useToken) {
          header.addAll(
            {'Authorization': 'Bearer $_token'},
          );
        }
        final response =
        await _dio.post(endpoint, data: body, options: options);
        return ApiUtils.toApiResponse(response);
      },
    );
    return result;
  }

  static Future<ApiResponse> put(
      String endpoint, {
        required dynamic body,
        bool useToken = true,
      }) async {
    final result = await _makeRequest(
          () async {
        final header = _defaultHeader;

        if (useToken) {
          header.addAll(
            {'Authorization': 'Bearer $_token'},
          );
        }

        final options = Options(headers: header);

        //TODO: check when data or body is null
        final response = await _dio.put(endpoint,
            data: body, queryParameters: body, options: options);

        return ApiUtils.toApiResponse(response);
      },
    );

    return result;
  }

  static Future<ApiResponse> delete(
      String endpoint, {
        required Map<String, dynamic> body,
        bool useToken = true,
      }) async {
    final result = await _makeRequest(
          () async {
        final header = _defaultHeader;

        if (useToken) {
          header.addAll(
            {'Authorization': 'Bearer $_token'},
          );
        }

        final options = Options(headers: header);

        final response =
        await _dio.delete(endpoint, data: body, options: options);
        return ApiUtils.toApiResponse(response);
      },
    );

    return result;
  }

  // static Future<bool> _refreshToken() async {
  //   // Get the expired token from SharedPreferences
  //   String expiredToken =
  //   locator<LocalStorageService>().getDataFromDisk(Keys.refreshToken);
  //   _refreshingToken = true;
  //   // Make a request to your refresh token endpoint
  //   try {
  //     _refreshTokenRetries++;
  //     if (_refreshTokenRetries >= 4) {
  //       Response response = await _dio.post(Endpoints.refreshUserToken,
  //           queryParameters: {'refreshToken': expiredToken},
  //           options: Options(headers: _defaultHeader));
  //       final result = ApiUtils.toApiResponse(response);
  //       if (result.statusCode == 201) {
  //         String newToken = result.data['accessToken'];
  //         String newRefreshToken = result.data['refreshToken'];
  //         locator<LocalStorageService>().saveDataToDisk(Keys.token, newToken);
  //         locator<LocalStorageService>()
  //             .saveDataToDisk(Keys.refreshToken, newRefreshToken);
  //         locator<LocalStorageService>().saveDataToDisk(
  //             Keys.tokenExpiryDate,
  //             DateTime(DateTime.now().year, DateTime.now().month,
  //                 DateTime.now().day, DateTime.now().hour + 23)
  //                 .toString());
  //         return true;
  //       }
  //       _refreshingToken = false;
  //       return true;
  //     } else {
  //       locator<AppStateService>().loginState = false;
  //       locator<LocalStorageService>().removeDataFromDisk(Keys.loginKey);
  //       locator<LocalStorageService>().removeDataFromDisk(Keys.userKey);
  //       locator<GoRouter>().go(AppRoutes.loginView);
  //       return false;
  //     }
  //   } catch (error) {
  //     locator<AppStateService>().loginState = false;
  //     locator<LocalStorageService>().removeDataFromDisk(Keys.loginKey);
  //     locator<LocalStorageService>().removeDataFromDisk(Keys.userKey);
  //     locator<GoRouter>().go(AppRoutes.loginView);
  //     return false;
  //   }
  // }


  /// [Handlers]

  static Future<ApiResponse> _makeRequest(Function request) async {
    try {
      final result = await request();
      return result;
    } on DioError catch (e, stack) {
      // FirebaseCrashlytics.instance.recordError(e, stack, fatal: true);
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        return ApiUtils.toApiResponse(e.response!);
      }
      _handleDioError(e);
      if (e.response?.statusCode == 404) {
        return ApiUtils.toApiResponse(e.response!);
      }
      return ApiUtils.toApiResponse(e.response!);
    } on SocketException catch (e) {
      _handleSocketException(e);
      return ApiUtils.genericError(
          message: e.message, isSuccessful: false, statusCode: e.port!);
    } catch (e) {
      return ApiUtils.genericError(
          message: e.toString(), isSuccessful: false, statusCode: 322);
    }
  }

  static void _handleDioError(DioError e) {
    print(e.response);
    if (e.response?.statusCode == 400) {
      // showBasicDialog(DialogRequestModel(
      //     title: e.response?.data["message"].toString().contains(
      //         "Doctor is not permited to view medical history") ==
      //         true
      //         ? "Permission Required"
      //         : "Invalid Details",
      //     variant: DialogType.basic,
      //     data: BasicDialogStatus.error,
      //     description: e.response?.data["message"]
      //         .toString()
      //         .contains("already taken") ==
      //         true
      //         ? "Email Address already taken, login or use a different email"
      //         : e.response?.data["message"],
      //     mainButtonTitle: e.response?.data["message"]
      //         .toString()
      //         .contains("permitted to view medical history") ==
      //         true
      //         ? "Okay"
      //         : "Try again"));
    } else if (e.response?.statusCode == 403) {
      //TODO::Replace this with an Actual logic
      OneContext.instance.showDialog(
          builder: (BuildContext context) => const Text("an Error Occured"));
    } else if (e.response?.statusCode == 404) {
      //   // e.response?.data["message"]
      //   showBasicDialog(DialogRequestModel(
      //       title: e.response?.data["message"],
      //       variant: DialogType.basic,
      //       data: BasicDialogStatus.error,
      //       description:
      //           "The email and password provided, is either incorrect or invalid",
      //       mainButtonTitle: "Try again"));
    } else if (e.response?.statusCode == 500) {
      // showErrorDialog("Something went wrong");
    }

    inspect(e.response);
  }

  static void _handleSocketException(SocketException e) {
    debugPrint('Check Internet');
  }

  static String _getToken() {
    String token =
        locator<LocalStorageService>().getDataFromDisk(AppStorekeys.token) ?? "";
    return token;
  }
}