import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_application/repository/sign_in_repository.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<DoSignIn>(_doSignIn);
  }

  Future<void> _doSignIn(
    DoSignIn event,
    Emitter<SignInState> emit,
  ) async {
    emit(state.copyWith(status: SignInStatus.initial));

    final signInRepo = SignInRepository();
    final result = await signInRepo.signIn(event.email, event.password);

    result != null
        ? emit(state.copyWith(status: SignInStatus.success))
        : emit(state.copyWith(status: SignInStatus.failure));

  }
}
