part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class DoSignIn extends SignInEvent {
  DoSignIn({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}
