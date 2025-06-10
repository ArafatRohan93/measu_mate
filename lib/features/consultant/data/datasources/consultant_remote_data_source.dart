import 'package:dartz/dartz.dart';
import 'package:measu_mate/core/error/api_error.dart';
import 'package:measu_mate/features/consultant/domain/entities/consultant_details.dart';

abstract class ConsultantRemoteDataSource {
  Future<Either<ApiError, ConsultantDetails>> fetchConsultantDetails(String id);
}

class ConsultantRemoteDataSourceImpl implements ConsultantRemoteDataSource {
  @override
  Future<Either<ApiError, ConsultantDetails>> fetchConsultantDetails(
      String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    // Dummy data
    return right(
      const ConsultantDetails(
        name: 'Dr. James Wilson',
        imageUrl: 'assets/images/engineer.png',
        degree1: 'BSc in CE, KUET',
        degree2: 'MSc in CE, BUET',
        specialistTitle: 'Estimation Specialist',
        educationList: [
          Education(
              title: 'BSc in Civil Engineering',
              subtitle: 'KUET - Class of 2016'),
          Education(
              title: 'MSc in Civil Engineering',
              subtitle: 'BUET - Class of 2018'),
        ],
        expertise: [
          'Structural Design',
          'Cost Estimation',
          'Project Planning',
          'Construction Management',
        ],
        projects: [
          Project(
            title: 'City Center Complex',
            subtitle: 'Structural design and estimation',
            imageUrl: 'assets/images/project.png',
            duration: '6 months',
          ),
          Project(
            title: 'Riverside Apartments',
            subtitle: 'Construction management',
            imageUrl: 'assets/images/project.png',
            duration: '8 months',
          ),
        ],
        timeSlots: [
          TimeSlot(day: 'Mon', date: '12 Feb', time: '10:00 AM - 11:00 AM'),
          TimeSlot(day: 'Tue', date: '13 Feb', time: '2:00 PM - 3:00 PM'),
          TimeSlot(day: 'Wed', date: '14 Feb', time: '11:00 AM - 12:00 PM'),
          TimeSlot(day: 'Wed', date: '14 Feb', time: '11:00 AM - 12:00 PM'),
        ],
      ),
    );
  }
}
