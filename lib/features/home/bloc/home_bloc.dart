import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_application/models/checklist_model.dart';
import 'package:my_application/repository/checklist_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<ChecklistFetched>(_checklistFetched);
  }

  Future<void> _checklistFetched(
    ChecklistFetched event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.initial));

    final checklistRepository = ChecklistRepository();
    final result = await checklistRepository.getAllChecklist();

    if (result == null) {
      emit(state.copyWith(status: HomeStatus.failure));
    } else {
      emit(state.copyWith(status: HomeStatus.success, checklist: result));
    }
  }
}
