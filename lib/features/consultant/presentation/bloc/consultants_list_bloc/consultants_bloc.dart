import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:measu_mate/features/consultant/domain/repositories/consultant_list_repository.dart';
import 'package:measu_mate/features/consultant/presentation/bloc/consultants_list_bloc/consultants_state.dart';

part 'consultants_event.dart';

enum ConsultantTab { engineer, architect }

class ConsultantsBloc extends Bloc<ConsultantsEvent, ConsultantsState> {
  final ConsultantListRepository repository;
  ConsultantsBloc(this.repository)
      : super(const ConsultantsLoading(ConsultantTab.engineer)) {
    on<LoadConsultants>((event, emit) async {
      emit(ConsultantsLoading(event.tab));
      final result = event.tab == ConsultantTab.engineer
          ? await repository.fetchEngineers()
          : await repository.fetchArchitects();
      result.fold(
        (error) => emit(ConsultantsError(error, event.tab)),
        (list) => emit(ConsultantsLoaded(list, event.tab)),
      );
    });
  }
}
