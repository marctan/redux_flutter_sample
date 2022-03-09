class AuthState {
  final bool isLoggedIn;

  AuthState(this.isLoggedIn);

  factory AuthState.initial() {
    return AuthState(false);
  }
}
