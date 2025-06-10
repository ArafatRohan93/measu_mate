import 'package:dartz/dartz.dart';
import 'package:measu_mate/core/error/api_error.dart';
import 'package:measu_mate/features/consultant/domain/entities/consultant_details.dart';

abstract class ConsultantRepository {
  Future<Either<ApiError, ConsultantDetails>> fetchConsultantDetails(String id);
}
