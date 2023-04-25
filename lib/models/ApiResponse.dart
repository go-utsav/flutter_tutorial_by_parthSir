import 'dart:convert';

class ApiResponse<T> {
  T? data;
  String? message;
  String status;

  ApiResponse({this.data, this.message, required this.status});

  Map<String, dynamic> toMap() {
    return {'message': message, 'status': status} as Map<String, dynamic>;
  }

  factory ApiResponse.fromMap(Map<String, dynamic> map) {
    return ApiResponse<T>(
        message: map['message'] as String?, status: map['status'] as String);
  }

  String toJson() => json.encode(toMap());

  factory ApiResponse.fromJson(String source) =>
      ApiResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  ApiResponse<T> copyWith({
    T? data,
    String? message,
    String? status,
  }) {
    return ApiResponse<T>(
      data: data ?? this.data,
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }

  @override
  String toString() {
    return 'ApiResponse(data: $data, message: $message, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ApiResponse<T> &&
        other.data == data &&
        other.message == message &&
        other.status == status;
  }

  @override
  int get hashCode {
    return data.hashCode ^ message.hashCode ^ status.hashCode;
  }
}
