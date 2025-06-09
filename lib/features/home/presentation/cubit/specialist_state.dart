part of 'specialist_cubit.dart';

abstract class SpecialistState extends Equatable {
  const SpecialistState();
  @override
  List<Object?> get props => [];
}

class SpecialistInitial extends SpecialistState {}

class SpecialistLoading extends SpecialistState {}

class SpecialistLoaded extends SpecialistState {
  final List<Specialist> specialists;
  const SpecialistLoaded(this.specialists);
  @override
  List<Object?> get props => [specialists];
}

class SpecialistFailure extends SpecialistState {
  final String message;
  const SpecialistFailure(this.message);
  @override
  List<Object?> get props => [message];
}
