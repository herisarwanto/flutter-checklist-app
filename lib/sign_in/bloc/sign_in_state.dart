part of 'sign_in_bloc.dart';

enum SignInStatus { initial, success, failure }

class SignInState extends Equatable {
  const SignInState({
    this.status = SignInStatus.initial,
  });

  final SignInStatus status;

  @override
  String toString() {
    return 'SignInState{status: $status}';
  }

  @override
  List<Object> get props => [status];

  SignInState copyWith({
    SignInStatus? status,
  }) {
    return SignInState(
      status: status ?? this.status,
    );
  }
}
