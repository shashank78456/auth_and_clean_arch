import 'package:auth_and_clean_arch/core/theme/theme.dart';
import 'package:auth_and_clean_arch/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:auth_and_clean_arch/features/auth/data/repository/auth_repository_impl.dart';
import 'package:auth_and_clean_arch/features/auth/domain/usecases/user_login.dart';
import 'package:auth_and_clean_arch/features/auth/domain/usecases/user_signup.dart';
import 'package:auth_and_clean_arch/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:auth_and_clean_arch/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
          create: (_) => AuthBloc(
              userSignup:
                  UserSignup(AuthRepositoryImpl(AuthRemoteDataSourceImpl(),),),
               userLogin:
                  UserLogin(AuthRepositoryImpl(AuthRemoteDataSourceImpl(),),),
            ),
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
      title: 'Blog App',
      theme: AppTheme.darkThemeMode,
      home: const LoginPage(),
    );
  }
}
