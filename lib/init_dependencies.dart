import 'package:clean_architecture_template/core/secretes/app_secetes.dart';
import 'package:clean_architecture_template/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:clean_architecture_template/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:clean_architecture_template/features/auth/domain/repository/auth_repository.dart';
import 'package:clean_architecture_template/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:clean_architecture_template/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:clean_architecture_template/features/auth/presentaion/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuthDependencies();

  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );

  serviceLocator.registerLazySingleton(() => supabase.client);
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

    // Bloc
    ..registerLazySingleton(
      () => AuthBloc(
        signInUseCase: serviceLocator(),
        signUpUseCase: serviceLocator(),
      ),
    );
}
