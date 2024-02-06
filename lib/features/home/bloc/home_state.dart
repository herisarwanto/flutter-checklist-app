part of 'home_bloc.dart';

enum HomeStatus { initial, success, failure }

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.initial,
    this.checklist = const [],
  });

  final HomeStatus status;
  final List<ChecklistModel> checklist;

  HomeState copyWith({
    HomeStatus? status,
    List<ChecklistModel>? checklist,
  }) {
    return HomeState(
      status: status ?? this.status,
      checklist: checklist ?? this.checklist,
    );
  }

  @override
  String toString() {
    return 'HomeState{status: $status, courses: $checklist}';
  }

  @override
  List<Object> get props => [status, checklist];
}
