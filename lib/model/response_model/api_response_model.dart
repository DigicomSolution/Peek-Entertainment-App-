class ApiResponse {
  dynamic data;
  String? message;
  bool? isSuccessful;
  int? statusCode;

  ApiResponse(
      {this.data,
        required this.message,
        required this.isSuccessful,
        required this.statusCode});

  @override
  String toString() {
    return 'ApiResponse(data: $data,message: $message,isSuccessful: $isSuccessful,statusCode: $statusCode,)';
  }
}
