import 'package:redux/redux.dart';
import 'package:redux_flutter/redux/actions.dart';
import 'package:redux_flutter/redux/app_state.dart';
import 'package:redux_flutter/redux/state/todo_state.dart';

final todoReducer = combineReducers<TodoState>(
  [
    TypedReducer<TodoState, TodoAddItem>(_addTodo),
  ],
);

TodoState _addTodo(TodoState state, TodoAddItem action) {
  return TodoState(
    List.from(state.todos)..add(action.item),
  );
}
