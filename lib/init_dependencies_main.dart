part of 'init_dependencies.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuthDependencies();

  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );

  serviceLocator.registerLazySingleton(() => supabase.client);

  // Core

  // --> app user cubit
  serviceLocator.registerLazySingleton(() => AppUserCubit());
}

void _initAuthDependencies() {
  // Datasource
  serviceLocator
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        serviceLocator(),
      ),
    )

    // Repository
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(
        serviceLocator(),
      ),
    )

    // usecasees
    // 1. sign in
    ..registerFactory<SignInUseCase>(
      () => SignInUseCase(
        authRepository: serviceLocator(),
      ),
    )

    //  2. sign up
    ..registerFactory<SignUpUsecase>(
      () => SignUpUsecase(
        authRepository: serviceLocator(),
      ),
    )

    // 3. get current user
    ..registerFactory<GetCurrentUserUsecase>(
      () => GetCurrentUserUsecase(
        authRepository: serviceLocator(),
      ),
    )

    // Bloc
    ..registerLazySingleton(
      () => AuthBloc(
        getCurrentUserUsecase: serviceLocator(),
        signInUseCase: serviceLocator(),
        signUpUseCase: serviceLocator(),
        appUserCubit: serviceLocator(),
      ),
    );
}
