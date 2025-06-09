import '../../domain/entities/specialist.dart';
import 'specialist_data_source.dart';

class SpecialistDataSourceImpl implements SpecialistDataSource {
  @override
  Future<List<Specialist>> getSpecialists() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      Specialist(
        name: 'Yousuf',
        degree: 'Msc in CE, KUET',
        imagePath: 'assets/images/engineer.png',
      ),
      Specialist(
        name: 'Ayesha',
        degree: 'Msc in CE, KUET',
        imagePath: 'assets/images/engineer.png',
      ),
      Specialist(
        name: 'Rahim',
        degree: 'Msc in CE, BUET',
        imagePath: 'assets/images/engineer.png',
      ),
    ];
  }
}
