import 'package:clean_architecture_template/features/auth/presentaion/bloc/auth_bloc.dart';
import 'package:clean_architecture_template/features/auth/presentaion/screens/sign_up_screen.dart';
import 'package:clean_architecture_template/core/theme/app_theme.dart';
import 'package:clean_architecture_template/init_dependencies.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => serviceLocator<AuthBloc>(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Clean architecture template',
        theme: AppTheme.darkTheme,
        home: const SignUpScreen());
  }
}
