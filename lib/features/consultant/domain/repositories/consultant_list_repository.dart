import 'package:dartz/dartz.dart';
import 'package:measu_mate/core/error/api_error.dart';
import 'package:measu_mate/features/consultant/domain/entities/consultant.dart';

abstract class ConsultantListRepository {
  Future<Either<ApiError, List<Consultant>>> fetchEngineers();
  Future<Either<ApiError, List<Consultant>>> fetchArchitects();
}
