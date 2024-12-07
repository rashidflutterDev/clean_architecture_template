import 'package:clean_architecture_template/core/secretes/app_secetes.dart';
import 'package:clean_architecture_template/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:clean_architecture_template/features/auth/data/repository/auth_repository_impl.dart';
import 'package:clean_architecture_template/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:clean_architecture_template/features/auth/presentaion/bloc/auth_bloc.dart';
import 'package:clean_architecture_template/features/auth/presentaion/screens/sign_up_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => AuthBloc(SignUpUsecase(
            authRepository: AuthRepositoryImpl(
                authRemoteDataSource:
                    AuthRemoteDataSourceImpl(Supabase.instance.client)))),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SignUpScreen());
  }
}
