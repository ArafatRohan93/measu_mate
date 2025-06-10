part of 'consultant_details_bloc.dart';

abstract class ConsultantDetailsEvent extends Equatable {
  const ConsultantDetailsEvent();
  @override
  List<Object?> get props => [];
}

class FetchConsultantDetails extends ConsultantDetailsEvent {
  final String id;
  const FetchConsultantDetails(this.id);
  @override
  List<Object?> get props => [id];
}
