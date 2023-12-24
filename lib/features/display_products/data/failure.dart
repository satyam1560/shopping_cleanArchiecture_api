import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final int? statusCode;
  final String? message;

  const Failure({
    this.statusCode,
    required this.message,
  });

  @override
  List<Object?> get props => [statusCode, message];
}

// class ServerFailure extends Failure {
//   const ServerFailure(String message) : super(message);
// }

// class ConnectionFailure extends Failure {
//   const ConnectionFailure(String message) : super(message);
// }

// class DatabaseFailure extends Failure {
//   const DatabaseFailure(String message) : super(message);
// }
