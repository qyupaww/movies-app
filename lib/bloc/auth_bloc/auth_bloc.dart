import 'package:flutter_bloc/flutter_bloc.dart';

import '../../service/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final MoviesSharedPreferences _prefs;

  AuthBloc(this._prefs) : super(const AuthState()) {
    on<AuthInitEvent>(_onInit);
    on<AuthLoginEvent>(_onLogin);
    on<AuthLogoutEvent>(_onLogout);
  }

  void _onInit(AuthInitEvent event, Emitter<AuthState> emit) async {
    emit(const AuthState(status: AuthStatus.loading));
    final user = await _prefs.getUser();
    if (user != null) {
      emit(AuthState(status: AuthStatus.authenticated, user: user));
    } else {
      emit(const AuthState(status: AuthStatus.unauthenticated));
    }
  }

  void _onLogin(AuthLoginEvent event, Emitter<AuthState> emit) async {
    emit(const AuthState(status: AuthStatus.loading));
    // Simplified validation: accept non-empty email/password
    if (event.email.isNotEmpty && event.password.isNotEmpty) {
      await _prefs.setUser(email: event.email, name: event.name);
      final user = await _prefs.getUser();
      emit(AuthState(status: AuthStatus.authenticated, user: user));
    } else {
      emit(const AuthState(status: AuthStatus.error, errorMessage: 'Invalid credentials'));
    }
  }

  void _onLogout(AuthLogoutEvent event, Emitter<AuthState> emit) async {
    await _prefs.clearUser();
    emit(const AuthState(status: AuthStatus.unauthenticated));
  }
}

