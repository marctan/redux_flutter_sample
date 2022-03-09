import 'package:redux/redux.dart';
import 'package:redux_flutter/redux/actions.dart';
import 'package:redux_flutter/redux/state/auth_state.dart';

final authReducer = combineReducers<AuthState>(
    [TypedReducer<AuthState, LoginUser>(_setLoggedIn)]);

AuthState _setLoggedIn(AuthState state, LoginUser action) {
  return AuthState(true);
}
