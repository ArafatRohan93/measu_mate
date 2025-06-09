part of 'project_cubit.dart';

abstract class ProjectState extends Equatable {
  const ProjectState();
  @override
  List<Object?> get props => [];
}

class ProjectInitial extends ProjectState {}

class ProjectLoading extends ProjectState {}

class ProjectLoaded extends ProjectState {
  final List<Project> projects;
  const ProjectLoaded(this.projects);
  @override
  List<Object?> get props => [projects];
}

class ProjectFailure extends ProjectState {
  final String message;
  const ProjectFailure(this.message);
  @override
  List<Object?> get props => [message];
}
