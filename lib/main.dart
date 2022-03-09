import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_flutter/redux/actions.dart';
import 'package:redux_flutter/redux/app_state.dart';
import 'package:redux_flutter/redux/reducers.dart';
import 'package:redux_flutter/redux/state/auth_state.dart';
import 'package:redux_flutter/redux/state/todo_state.dart';
import 'package:redux_thunk/redux_thunk.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final Store<AppState> store = Store<AppState>(
    reducer,
    middleware: [thunkMiddleware],
    initialState: AppState(
      authState: AuthState.initial(),
      todoState: TodoState.initial(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: const MaterialApp(
        home: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int num = 0;
  late Store<AppState> p;

  increment() {
    setState(() {
      num++;
    });
  }

  @override
  Widget build(BuildContext context) {
    p = StoreProvider.of<AppState>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => p.dispatch(Increment()),
      ),
      body: StoreConnector<AppState, AppState>(
          converter: (store) => store.state,
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text('hello world ${state.value}'),
                ),
                ElevatedButton(
                  onPressed: () {
                    p.dispatch(
                      TodoAddItem("item #${state.value}"),
                    );
                  },
                  child: const Text("add item"),
                ),
                ElevatedButton(
                  onPressed: () {
                    p.dispatch(request);
                  },
                  child: const Text("show loading"),
                ),
                state.loading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Container(),
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    itemBuilder: (_, index) {
                      String item = state.todoState.todos[index];
                      return Center(child: Text(item));
                    },
                    itemCount: state.todoState.todos.length,
                  ),
                ),
              ],
            );
          }),
    );
  }
}
