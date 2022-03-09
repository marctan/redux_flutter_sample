import 'package:redux_flutter/redux/state/auth_state.dart';
import 'package:redux_flutter/redux/state/todo_state.dart';

class AppState {
  final int value;
  final bool loading;
  final TodoState todoState;
  final AuthState authState;

  AppState({
    this.value = 0,
    this.loading = false,
    required this.todoState,
    required this.authState,
  });
}
