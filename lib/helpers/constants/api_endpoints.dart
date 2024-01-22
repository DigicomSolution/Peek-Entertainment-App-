class ApiEndpoints {
  static const baseUrl = "https://localhost:7086";
  static const loginUser = '$baseUrl/api/Auth/Login';
  static const registerUser = '$baseUrl/api/Auth/Register';
  static const createUserProfile = '$baseUrl/api/User/CreateUserProfile';
  static const getUserProfile = '$baseUrl/api/User/GetUserProfile';
  static const getUserPersonalDetails =
      '$baseUrl/api/User/GetUserPersonalDetails';
}
