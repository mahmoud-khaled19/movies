class ErrorMessageModel {
  final double statusCode;
  final String message;
  final bool success;

  const ErrorMessageModel({
    required this.statusCode,
    required this.message,
    required this.success,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) =>
      ErrorMessageModel(
        statusCode: json['status_code'],
        message: json['status_message'],
        success: json['success'],
      );
}
