import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:measu_mate/features/auth/domain/usecases/login_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginCubit(this.loginUseCase) : super(const LoginInitial());

  Future<void> login(String email, String password) async {
    emit(const LoginLoading());
    try {
      final result = await loginUseCase(email, password);
      if (result) {
        emit(const LoginSuccess());
      } else {
        emit(const LoginFailure('Login failed'));
      }
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
