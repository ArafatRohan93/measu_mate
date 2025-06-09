import '../../domain/entities/specialist.dart';

abstract class SpecialistDataSource {
  Future<List<Specialist>> getSpecialists();
}
