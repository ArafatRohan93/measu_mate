import 'package:dartz/dartz.dart';
import 'package:measu_mate/core/error/api_error.dart';
import 'package:measu_mate/features/consultant/domain/entities/consultant_details.dart';
import 'package:measu_mate/features/consultant/domain/repositories/consultant_repository.dart';
import 'package:measu_mate/features/consultant/data/datasources/consultant_remote_data_source.dart';

class ConsultantRepositoryImpl implements ConsultantRepository {
  final ConsultantRemoteDataSource remoteDataSource;
  ConsultantRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<ApiError, ConsultantDetails>> fetchConsultantDetails(
      String id) {
    return remoteDataSource.fetchConsultantDetails(id);
  }
}
