import 'package:dio/dio.dart';

import '../../model/response_model/api_response_model.dart';

class ApiUtils {
  static ApiResponse toApiResponse(Response res) {
    return ApiResponse(
      statusCode: res.data['statusCode'],
      message: res.data['message'],
      data: res.data['data'],
      isSuccessful: res.data['isSuccessful'],
    );
  }

// for errors not returned from the server
  static ApiResponse genericError(
      {required String message,
        required bool isSuccessful,
        required int statusCode,
        dynamic data}) {
    return ApiResponse(
      statusCode: statusCode,
      data: null,
      message: message,
      isSuccessful: isSuccessful,
    );
  }
}
