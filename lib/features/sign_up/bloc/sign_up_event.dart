part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class DoSignUp extends SignUpEvent {
  DoSignUp({
    required this.email,
    required this.password,
    required this.username,
  });

  final String email;
  final String password;
  final String username;
}
