part of 'sign_up_bloc.dart';

class SignUpState extends Equatable {
  const SignUpState({
    this.status = StatusState.initial,
    this.message = '',
  });

  final StatusState status;
  final String message;

  @override
  List<Object> get props => [status, message];

  SignUpState copyWith({
    StatusState? status,
    String? message,
  }) {
    return SignUpState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}
