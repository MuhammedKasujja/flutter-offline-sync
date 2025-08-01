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
  bool success;
  T? data;
  String? message;
  String? error;
  int? code;

  ApiResponse({
    required this.success,
    this.data,
    this.message,
    this.error,
    this.code,
  });

  factory ApiResponse.error(String? error) {
    return ApiResponse(success: false, error: error);
  }

  factory ApiResponse.success(Map<String, dynamic> json) {
    return ApiResponse(
      code: json['code'],
      message: json['message'],
      success: true,
      data: json['data'],
    );
  }

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic json)? fromJsonT,
  ) {
    return ApiResponse(
      code: json['code'],
      message: json['message'],
      success: json['success'],
      data:
          json['data'] != null
              ? fromJsonT != null
                  ? fromJsonT(json['data'])
                  : json['data']
              : null,
    );
  }

  factory ApiResponse.fromError(Map<String, dynamic> json) {
    return ApiResponse(success: false, error: json['error']);
  }

  bool get isSuccess => success == true;

  bool get isError => success == false || error != null;

  ApiResponse<T> copyWith({
    bool? status,
    T? data,
    String? message,
    String? error,
    int? code,
  }) {
    return ApiResponse(
      success: status ?? this.success,
      data: data ?? this.data,
      message: message ?? this.message,
      error: error ?? this.error,
      code: code ?? this.code,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{'success': success};

    if (message != null) {
      map['message'] = message;
    }
    if (error != null) {
      map['error'] = error;
    }
    if (data != null) {
      map['data'] = data;
    }
    return map;
  }
}
