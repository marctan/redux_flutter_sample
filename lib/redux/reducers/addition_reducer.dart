import 'package:redux/redux.dart';
import 'package:redux_flutter/redux/actions.dart';

final additionReducer = combineReducers<int>([
  TypedReducer<int, Increment>(_increment),
]);

int _increment(int value, Increment action) {
  return value + 1;
}
