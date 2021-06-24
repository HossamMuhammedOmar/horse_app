class LoginModel {
  bool? status;
  String? message;

  LoginModel.fromJson(Map<String, dynamic>? json) {
    status = json?['status'];
    message = json?['message'];
  }
}
