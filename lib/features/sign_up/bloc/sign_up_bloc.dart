import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_application/common/utils/state_enum.dart';
import 'package:my_application/repository/sign_up_repository.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(const SignUpState()) {
    on<DoSignUp>(_doSignUp);
  }

  Future<void> _doSignUp(
    DoSignUp event,
    Emitter<SignUpState> emit,
  ) async {
    emit(state.copyWith(status: StatusState.initial));

    final signUpRepository = SignUpRepository();
    final result = await signUpRepository.signUp(
        event.email, event.password, event.username,);

    if (result == null) {
      emit(state.copyWith(status: StatusState.failure));
    } else {
      emit(state.copyWith(status: StatusState.success, message: result));
    }
  }
}
