// core/errors/failures.dart

class Failure {
  final String mensaje;
  final int? codigo;
  final dynamic error;

  Failure({
    required this.mensaje,
    this.codigo,
    this.error,
    required String message,
  });

  @override
  String toString() =>
      'Failure(mensaje: $mensaje, codigo: $codigo, error: $error)';
}

class ServerFailure extends Failure {
  final String? message;

  ServerFailure({this.message})
    : super(
        mensaje: message ?? 'Error en el servidor',
        message: message ?? 'Error en el servidor',
      );
}

class CacheFailure extends Failure {
  CacheFailure({required super.mensaje, required super.message});
}

class NoInternetFailure extends Failure {
  NoInternetFailure({required super.mensaje, required super.message});
}

class UnexpectedFailure extends Failure {
  final String message;

  // ignore: use_super_parameters
  UnexpectedFailure(this.message, {required super.mensaje})
    : super(message: message);

  List<Object> get props => [message];
}
