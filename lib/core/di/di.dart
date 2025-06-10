import 'package:get_it/get_it.dart';
import 'package:measu_mate/features/consultant/data/datasources/consultant_remote_data_source.dart';
import 'package:measu_mate/features/consultant/data/repositories/consultant_repository_impl.dart';
import 'package:measu_mate/features/consultant/domain/repositories/consultant_repository.dart';
import 'package:measu_mate/features/consultant/presentation/bloc/consultant_details_bloc/consultant_details_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/auth/data/datasources/auth_remote_data_source.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';
import '../../features/auth/domain/usecases/signup_usecase.dart';
import '../../features/auth/presentation/cubit/signup_cubit.dart';
// Home dependencies
import '../../features/home/data/datasources/specialist_data_source.dart';
import '../../features/home/data/datasources/specialist_data_source_impl.dart';
import '../../features/home/data/datasources/project_data_source.dart';
import '../../features/home/data/datasources/project_data_source_impl.dart';
import '../../features/home/data/repositories/specialist_repository_impl.dart';
import '../../features/home/data/repositories/project_repository_impl.dart';
import '../../features/home/domain/repositories/specialist_repository.dart';
import '../../features/home/domain/repositories/project_repository.dart';
import '../../features/home/domain/usecases/get_specialists_usecase.dart';
import '../../features/home/domain/usecases/get_projects_usecase.dart';
import '../../features/home/presentation/cubit/specialist_cubit.dart';
import '../../features/home/presentation/cubit/project_cubit.dart';
// Consultants List
import 'package:measu_mate/features/consultant/data/datasources/consultant_list_remote_data_source.dart';
import 'package:measu_mate/features/consultant/data/repositories/consultant_list_repository_impl.dart';
import 'package:measu_mate/features/consultant/domain/repositories/consultant_list_repository.dart';
import 'package:measu_mate/features/consultant/presentation/bloc/consultants_list_bloc/consultants_bloc.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(sharedPreferences);

  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl());

  // Repository
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(sl(), sl()));

  // Usecases
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => SignupUseCase(sl()));

  // Cubits
  sl.registerFactory(() => SignupCubit(sl()));

  // Home: Specialist
  sl.registerLazySingleton<SpecialistDataSource>(
      () => SpecialistDataSourceImpl());
  sl.registerLazySingleton<SpecialistRepository>(
      () => SpecialistRepositoryImpl(sl()));
  sl.registerLazySingleton(() => GetSpecialistsUseCase(sl()));
  sl.registerFactory(() => SpecialistCubit(sl()));

  // Home: Project
  sl.registerLazySingleton<ProjectDataSource>(() => ProjectDataSourceImpl());
  sl.registerLazySingleton<ProjectRepository>(
      () => ProjectRepositoryImpl(sl()));
  sl.registerLazySingleton(() => GetProjectsUseCase(sl()));
  sl.registerFactory(() => ProjectCubit(sl()));

  // Consultant Details
  sl.registerLazySingleton<ConsultantRemoteDataSource>(
      () => ConsultantRemoteDataSourceImpl());
  sl.registerLazySingleton<ConsultantRepository>(
      () => ConsultantRepositoryImpl(sl()));
  sl.registerFactory(() => ConsultantDetailsBloc(sl()));

  // Consultants List
  sl.registerLazySingleton<ConsultantListRemoteDataSource>(
      () => ConsultantListRemoteDataSourceImpl());
  sl.registerLazySingleton<ConsultantListRepository>(
      () => ConsultantListRepositoryImpl(sl()));
  sl.registerFactory(() => ConsultantsBloc(sl()));
}
