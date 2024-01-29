import 'package:equatable/equatable.dart';

class TodoState extends Equatable {
  final List<String> todoList;
  const TodoState({this.todoList = const []});

  TodoState copyWith({List<String>? todosList}) {
    return TodoState(todoList: todosList ?? this.todoList);
  }

  @override
  List<Object?> get props => [todoList];
}
