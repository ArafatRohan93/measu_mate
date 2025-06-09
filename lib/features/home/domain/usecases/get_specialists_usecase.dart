import '../entities/specialist.dart';
import '../repositories/specialist_repository.dart';

class GetSpecialistsUseCase {
  final SpecialistRepository repository;
  GetSpecialistsUseCase(this.repository);

  Future<List<Specialist>> call() {
    return repository.getSpecialists();
  }
}
