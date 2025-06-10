import 'package:measu_mate/core/error/api_error.dart';
import 'package:measu_mate/features/consultant/domain/entities/consultant.dart';
import 'package:equatable/equatable.dart';
import 'package:measu_mate/features/consultant/presentation/bloc/consultants_list_bloc/consultants_bloc.dart';

abstract class ConsultantsState extends Equatable {
  final ConsultantTab tab;
  const ConsultantsState(this.tab);
  @override
  List<Object?> get props => [tab];
}

class ConsultantsLoading extends ConsultantsState {
  const ConsultantsLoading(ConsultantTab tab) : super(tab);
}

class ConsultantsLoaded extends ConsultantsState {
  final List<Consultant> consultants;
  const ConsultantsLoaded(this.consultants, ConsultantTab tab) : super(tab);
  @override
  List<Object?> get props => [consultants, tab];
}

class ConsultantsError extends ConsultantsState {
  final ApiError error;
  const ConsultantsError(this.error, ConsultantTab tab) : super(tab);
  @override
  List<Object?> get props => [error, tab];
}
