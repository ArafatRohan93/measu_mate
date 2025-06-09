import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final SharedPreferences sharedPreferences;

  AuthRepositoryImpl(this.remoteDataSource, this.sharedPreferences);

  @override
  Future<bool> login(String email, String password) async {
    final result = await remoteDataSource.login(email, password);
    if (result) {
      await sharedPreferences.setBool('is_logged_in', true);
    }
    return result;
  }

  @override
  Future<bool> isLoggedIn() async {
    return sharedPreferences.getBool('is_logged_in') ?? false;
  }

  @override
  Future<bool> signup({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return true; // Dummy success
  }
}
