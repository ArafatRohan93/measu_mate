import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/specialist.dart';
import '../../domain/usecases/get_specialists_usecase.dart';

part 'specialist_state.dart';

class SpecialistCubit extends Cubit<SpecialistState> {
  final GetSpecialistsUseCase getSpecialistsUseCase;
  SpecialistCubit(this.getSpecialistsUseCase) : super(SpecialistInitial());

  Future<void> fetchSpecialists() async {
    emit(SpecialistLoading());
    try {
      final specialists = await getSpecialistsUseCase();
      emit(SpecialistLoaded(specialists));
    } catch (e) {
      emit(SpecialistFailure(e.toString()));
    }
  }
}
