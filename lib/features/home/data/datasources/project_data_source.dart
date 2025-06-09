import '../../domain/entities/project.dart';

abstract class ProjectDataSource {
  Future<List<Project>> getProjects();
}
