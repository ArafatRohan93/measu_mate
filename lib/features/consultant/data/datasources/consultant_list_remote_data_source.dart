import 'package:dartz/dartz.dart';
import 'package:measu_mate/core/error/api_error.dart';
import 'package:measu_mate/features/consultant/domain/entities/consultant.dart';

abstract class ConsultantListRemoteDataSource {
  Future<Either<ApiError, List<Consultant>>> fetchEngineers();
  Future<Either<ApiError, List<Consultant>>> fetchArchitects();
}

class ConsultantListRemoteDataSourceImpl
    implements ConsultantListRemoteDataSource {
  @override
  Future<Either<ApiError, List<Consultant>>> fetchEngineers() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return right(const [
      Consultant(
        name: 'Yousuf Alam',
        degree1: 'BSc in CE, KUET',
        degree2: 'MSc in CE, BUET',
        specialistTitle: 'Estimation Specialist',
        imageUrl: 'assets/images/engineer.png',
      ),
      Consultant(
        name: 'Waliul Islam',
        degree1: 'BSc in CE, KUET',
        degree2: 'MSc in CE, BUET',
        specialistTitle: 'Estimation Specialist',
        imageUrl: 'assets/images/engineer.png',
      ),
    ]);
  }

  @override
  Future<Either<ApiError, List<Consultant>>> fetchArchitects() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return right(const [
      Consultant(
        name: 'Yousuf Alam',
        degree1: 'BArc in Arc, KUET',
        degree2: 'MArc in Arc, BUET',
        specialistTitle: 'Interior Specialist',
        imageUrl: 'assets/images/engineer.png',
      ),
      Consultant(
        name: 'Sarah Smith',
        degree1: 'BSc in Philosophy, ...',
        degree2: 'MA in Philosophy...',
        specialistTitle: 'Research Fellow',
        imageUrl: 'assets/images/engineer.png',
      ),
      Consultant(
        name: 'Marcus Br...',
        degree1: 'BA in Economics, H...',
        degree2: 'MSc in Economic...',
        specialistTitle: 'Financial Analyst',
        imageUrl: 'assets/images/engineer.png',
      ),
    ]);
  }
}
