import 'package:clean_architecture_template/core/cubits/app_user/app_user_cubit.dart';
import 'package:clean_architecture_template/features/auth/presentaion/bloc/auth_bloc.dart';
import 'package:clean_architecture_template/features/auth/presentaion/screens/sign_up_screen.dart';
import 'package:clean_architecture_template/core/theme/app_theme.dart';
import 'package:clean_architecture_template/features/home/home_screen.dart';
import 'package:clean_architecture_template/init_dependencies.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => serviceLocator<AppUserCubit>(),
        ),
        BlocProvider(
          create: (context) => serviceLocator<AuthBloc>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    context.read<AuthBloc>().add((IsUserSignedIn()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clean architecture template',
      theme: AppTheme.darkTheme,
      home: BlocSelector<AppUserCubit, AppUserState, bool>(
        selector: (state) {
          return state is AppUserSignedIn;
        },
        builder: (context, state) {
          if (state is AppUserSignedIn) {
            return const HomeScreen();
          } else {
            return const SignUpScreen();
          }
        },
      ),
    );
  }
}
