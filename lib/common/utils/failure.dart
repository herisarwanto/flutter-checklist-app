import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {
  ServerFailure({
    required this.statusCode,
    required this.message,
  });

  final int statusCode;
  final String message;
}
