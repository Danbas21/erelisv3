// lib/core/errors/exceptions.dart
class ServerException implements Exception {
  final String message;

  ServerException({this.message = 'Server error occurred'});
}

class CacheException implements Exception {
  final String message;

  CacheException({this.message = 'Cache error occurred'});
}

class NetworkException implements Exception {
  final String message;

  NetworkException({this.message = 'Network error occurred'});
}

class UnauthorizedException implements Exception {
  final String message;

  UnauthorizedException({this.message = 'User is not authorized'});
}
