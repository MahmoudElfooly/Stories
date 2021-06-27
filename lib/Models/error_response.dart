import 'dart:convert';

class ErrorResponse {
  String code;
  String key;
  String message;
  String error;

  ErrorResponse({
    required this.code,
    required this.key,
    required this.message,
    required this.error,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      code: json["code"],
      key: json["key"],
      message: json["message"],
      error: json["error"],
    );
  }
}

ErrorResponse errorResponseFromJson(String str) {
  final jsonData = json.decode(str);
  return ErrorResponse.fromJson(jsonData);
}
