import '../repositories/auth_repository.dart';

class SignupUseCase {
  final AuthRepository repository;
  SignupUseCase(this.repository);

  Future<bool> call({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) {
    return repository.signup(
      name: name,
      email: email,
      phone: phone,
      password: password,
    );
  }
}
