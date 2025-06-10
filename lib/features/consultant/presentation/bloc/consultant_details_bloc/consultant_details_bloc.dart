import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:measu_mate/features/consultant/domain/repositories/consultant_repository.dart';
import 'package:measu_mate/features/consultant/presentation/bloc/consultant_details_bloc/consultant_details_state.dart';

part 'consultant_details_event.dart';

class ConsultantDetailsBloc
    extends Bloc<ConsultantDetailsEvent, ConsultantDetailsState> {
  final ConsultantRepository repository;
  ConsultantDetailsBloc(this.repository) : super(ConsultantDetailsLoading()) {
    on<FetchConsultantDetails>((event, emit) async {
      emit(ConsultantDetailsLoading());
      final result = await repository.fetchConsultantDetails(event.id);
      result.fold(
        (error) => emit(ConsultantDetailsError(error)),
        (details) => emit(ConsultantDetailsLoaded(details)),
      );
    });
  }
}
