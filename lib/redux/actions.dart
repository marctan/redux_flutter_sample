import 'package:redux/redux.dart';
import 'package:redux_flutter/redux/app_state.dart';

class Increment {}

class Loading {
  final bool isLoading;

  Loading(this.isLoading);
}

class TodoAddItem {
  final String item;

  TodoAddItem(this.item);
}

class LoginUser {}


//try transfer to repo and create new action file
Future<void> request(Store<AppState> store) async {
  store.dispatch(Loading(true));

  await Future.delayed(
    const Duration(seconds: 3),
  );

  store.dispatch(Loading(false));
}
