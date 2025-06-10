import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit(int initialIndex) : super(NavigationState(initialIndex));

  void changeIndex(int index) {
    emit(NavigationState(index));
  }
}
