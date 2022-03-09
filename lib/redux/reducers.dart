import 'package:redux_flutter/redux/actions.dart';
import 'package:redux_flutter/redux/app_state.dart';
import 'package:redux_flutter/redux/reducers/addition_reducer.dart';
import 'package:redux_flutter/redux/reducers/auth_reducer.dart';
import 'package:redux_flutter/redux/reducers/todo_reducer.dart';
import 'package:redux_flutter/redux/state/todo_state.dart';

AppState reducer(AppState previous, dynamic action) {
  return AppState(
    value: additionReducer(previous.value, action),
    todoState: todoReducer(previous.todoState, action),
    authState: authReducer(previous.authState, action),
    loading: action is Loading ? action.isLoading : false,
  );
}
