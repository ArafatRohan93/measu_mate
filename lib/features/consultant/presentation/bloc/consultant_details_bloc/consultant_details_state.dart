import 'package:measu_mate/core/error/api_error.dart';
import 'package:measu_mate/features/consultant/domain/entities/consultant_details.dart';
import 'package:equatable/equatable.dart';

abstract class ConsultantDetailsState extends Equatable {
  const ConsultantDetailsState();
  @override
  List<Object?> get props => [];
}

class ConsultantDetailsLoading extends ConsultantDetailsState {}

class ConsultantDetailsLoaded extends ConsultantDetailsState {
  final ConsultantDetails details;
  const ConsultantDetailsLoaded(this.details);
  @override
  List<Object?> get props => [details];
}

class ConsultantDetailsError extends ConsultantDetailsState {
  final ApiError error;
  const ConsultantDetailsError(this.error);
  @override
  List<Object?> get props => [error];
}
