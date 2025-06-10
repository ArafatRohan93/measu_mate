import 'package:dartz/dartz.dart';
import 'package:measu_mate/core/error/api_error.dart';
import 'package:measu_mate/features/consultant/domain/entities/consultant.dart';
import 'package:measu_mate/features/consultant/domain/repositories/consultant_list_repository.dart';
import 'package:measu_mate/features/consultant/data/datasources/consultant_list_remote_data_source.dart';

class ConsultantListRepositoryImpl implements ConsultantListRepository {
  final ConsultantListRemoteDataSource remoteDataSource;
  ConsultantListRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<ApiError, List<Consultant>>> fetchEngineers() {
    return remoteDataSource.fetchEngineers();
  }

  @override
  Future<Either<ApiError, List<Consultant>>> fetchArchitects() {
    return remoteDataSource.fetchArchitects();
  }
}
