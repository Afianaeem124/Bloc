import 'package:blflutter/bloc/todo/todoEvents.dart';
import 'package:blflutter/bloc/todo/todoState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoBloc extends Bloc<TodoEvents, TodoState> {
  List<String> todolist = [];
  TodoBloc() : super(const TodoState()) {
    on<AddTodoEvent>(_addtodo);
  }

  void _addtodo(AddTodoEvent event, Emitter<TodoState> emit) {
    todolist.add(event.task);
    emit(state.copyWith(todosList: List.from(todolist)));
  }
}
