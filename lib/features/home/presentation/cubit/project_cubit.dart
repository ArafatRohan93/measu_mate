import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/project.dart';
import '../../domain/usecases/get_projects_usecase.dart';

part 'project_state.dart';

class ProjectCubit extends Cubit<ProjectState> {
  final GetProjectsUseCase getProjectsUseCase;
  ProjectCubit(this.getProjectsUseCase) : super(ProjectInitial());

  Future<void> fetchProjects() async {
    emit(ProjectLoading());
    try {
      final projects = await getProjectsUseCase();
      emit(ProjectLoaded(projects));
    } catch (e) {
      emit(ProjectFailure(e.toString()));
    }
  }
}
