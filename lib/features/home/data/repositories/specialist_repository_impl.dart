import '../../domain/entities/specialist.dart';
import '../../domain/repositories/specialist_repository.dart';
import '../datasources/specialist_data_source.dart';

class SpecialistRepositoryImpl implements SpecialistRepository {
  final SpecialistDataSource dataSource;
  SpecialistRepositoryImpl(this.dataSource);

  @override
  Future<List<Specialist>> getSpecialists() {
    return dataSource.getSpecialists();
  }
}
