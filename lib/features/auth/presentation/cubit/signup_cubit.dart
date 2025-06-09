import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:measu_mate/features/auth/domain/usecases/signup_usecase.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupUseCase signupUseCase;
  SignupCubit(this.signupUseCase) : super(const SignupInitial());

  Future<void> signup({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    emit(const SignupLoading());
    try {
      final result = await signupUseCase(
        name: name,
        email: email,
        phone: phone,
        password: password,
      );
      if (result) {
        emit(const SignupSuccess());
      } else {
        emit(const SignupFailure('Signup failed'));
      }
    } catch (e) {
      emit(SignupFailure(e.toString()));
    }
  }
}
