import '../../domain/entities/project.dart';
import '../../domain/repositories/project_repository.dart';
import '../datasources/project_data_source.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final ProjectDataSource dataSource;
  ProjectRepositoryImpl(this.dataSource);

  @override
  Future<List<Project>> getProjects() {
    return dataSource.getProjects();
  }
}
