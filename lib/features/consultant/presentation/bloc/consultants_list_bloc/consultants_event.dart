part of 'consultants_bloc.dart';

abstract class ConsultantsEvent extends Equatable {
  const ConsultantsEvent();
  @override
  List<Object?> get props => [];
}

class LoadConsultants extends ConsultantsEvent {
  final ConsultantTab tab;
  const LoadConsultants(this.tab);
  @override
  List<Object?> get props => [tab];
}
