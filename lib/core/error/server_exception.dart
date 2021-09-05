import 'package:flutter/foundation.dart';

class ServerException implements Exception {
  ServerException({
    @required this.statusCode,
    @required this.message,
    this.request,
  });

  final int statusCode;
  final String message;
  final String request;
}
