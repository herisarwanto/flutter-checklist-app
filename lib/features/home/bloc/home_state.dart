part of 'home_bloc.dart';

enum HomeStatus { initial, success, failure }

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.initial,
    this.courses = const [],
  });

  final HomeStatus status;
  final List<CourseModel> courses;

  HomeState copyWith({
    HomeStatus? status,
    List<CourseModel>? courses,
  }) {
    return HomeState(
      status: status ?? this.status,
      courses: courses ?? this.courses,
    );
  }

  @override
  String toString() {
    return 'HomeState{status: $status, courses: $courses}';
  }

  @override
  List<Object> get props => [status, courses];
}
