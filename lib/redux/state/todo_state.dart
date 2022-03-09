class TodoState {
  final List<String> todos;

  const TodoState(this.todos);

  factory TodoState.initial() {
    return const TodoState([]);
  }

  TodoState copyWith({List<String>? todos}) {
    return TodoState(todos ?? this.todos);
  }
}
