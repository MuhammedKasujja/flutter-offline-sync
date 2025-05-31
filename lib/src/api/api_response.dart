///
/// API response structure
///
/// [status] the status of the response
///
/// [data] [T] returned by the API
///
/// [message] notification from the API
///
/// [error] returned if something goes wrong on `Server` or `user device`
///
/// like no internet connection on the user device or route not found on the serve
///

class ApiResponse<T> {
  bool status;
  T? data;
  String? message;
  String? error;
  int? code;

  ApiResponse({
    required this.status,
    this.data,
    this.message,
    this.error,
    this.code,
  });

  factory ApiResponse.error(String? error) {
    return ApiResponse(status: false, error: error, message: error);
  }

  factory ApiResponse.success(Map<String, dynamic> json) {
    return ApiResponse(
      code: json['code'],
      message: json['message'],
      status: true,
      data: json['data']
    );
  }

  bool get isSuccess => status == true;

  bool get isError => status == false || error != null;

  ApiResponse<T> copyWith({
    bool? status,
    T? data,
    String? message,
    String? error,
    int? code,
  }) {
    return ApiResponse(
      status: status ?? this.status,
      data: data ?? this.data,
      message: message ?? this.message,
      error: error ?? this.error,
      code: code ?? this.code,
    );
  }
}
