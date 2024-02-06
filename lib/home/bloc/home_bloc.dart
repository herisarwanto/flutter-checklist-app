import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_application/models/course_model.dart';
import 'package:my_application/repository/course_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<CourseFetched>(_courseFetched);
  }

  Future<void> _courseFetched(
    CourseFetched event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.initial));

    final courseRepository = CourseRepository();
    final result = await courseRepository.getAllCourse();

    if (result == null) {
      emit(state.copyWith(status: HomeStatus.failure));
    } else {
      emit(state.copyWith(status: HomeStatus.success, courses: result));
    }

  }
}
