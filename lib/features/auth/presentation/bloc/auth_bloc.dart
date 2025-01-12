import 'package:auth_and_clean_arch/features/auth/domain/entities/user.dart';
import 'package:auth_and_clean_arch/features/auth/domain/usecases/user_login.dart';
import 'package:auth_and_clean_arch/features/auth/domain/usecases/user_signup.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignup _userSignup;
  final UserLogin _userLogin;
  AuthBloc({
    required UserSignup userSignup,
    required UserLogin userLogin,
  })  : _userSignup = userSignup,
        _userLogin = userLogin,
        super(AuthInitial()) {
    on<AuthSignUp>((event, emit) async {
      emit(AuthLoading()); 
      final response = await _userSignup(UserSignupParams(
        name: event.name,
        email: event.email,
        password: event.password,
      ));

      response.fold(
          (failure) => emit(AuthFailure(failure.message)),
          (user) => emit(AuthSuccess(user))
        );
    });
    on<AuthLogin>((event, emit) async {
      emit(AuthLoading()); 
      final response = await _userLogin (UserLoginParams(
        email: event.email,
        password: event.password,
      ));

      response.fold(
          (failure) => emit(AuthFailure(failure.message)),
          (user) => emit(AuthSuccess(user))
        );
    });
  }
}
