import 'package:equatable/equatable.dart';

abstract class TodoEvents extends Equatable {
  const TodoEvents();
}

class AddTodoEvent extends TodoEvents {
  final String task;

  const AddTodoEvent(this.task);

  @override
  List<Object?> get props => [task];
}

class RemoveTodoEvent extends TodoEvents {
  final Object index;
  const RemoveTodoEvent(this.index);

  @override
  List<Object?> get props => [index];
}
