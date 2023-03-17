import 'package:untitled1/app/errors/error_message_model.dart';

class ServerExceptions implements Exception {
  final ErrorMessageModel errorMessageModel;

  const ServerExceptions({required this.errorMessageModel});
}

class LocalDataBaseExceptions implements Exception {
  final String message;

  const LocalDataBaseExceptions({required this.message});
}
