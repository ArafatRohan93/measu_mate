import '../../domain/entities/project.dart';
import 'project_data_source.dart';

class ProjectDataSourceImpl implements ProjectDataSource {
  @override
  Future<List<Project>> getProjects() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      Project(
        title: 'Arafat Palace',
        subtitle: 'Estimated Cost',
        imagePath: 'assets/images/construction_site.png',
        cost: 1.2,
        progress: 0.7,
      ),
      Project(
        title: 'Dream Villa',
        subtitle: 'Estimated Cost',
        imagePath: 'assets/images/construction_site.png',
        cost: 0.8,
        progress: 0.4,
      ),
    ];
  }
}
