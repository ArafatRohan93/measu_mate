abstract class AuthRepository {
  Future<bool> login(String email, String password);
  Future<bool> isLoggedIn();
  Future<bool> signup({
    required String name,
    required String email,
    required String phone,
    required String password,
  });
}
